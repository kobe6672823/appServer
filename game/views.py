from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from game.models import User, Chapter, Story, CoauthorsStatistics
import requests
import json
import sys
import time

def __resultToJson(errorCode, errorMsg, detail):
    """a method for dump result into str for httpresponse"""

    result = {}
    result['code'] = errorCode
    result['msg'] = errorMsg
    for k in detail.keys():
        if not (type(detail[k]) == type('str')):
            detail[k] = str(detail[k])
    result['detail'] = detail
    return json.dumps(result)
    return HttpResponse(json.dumps(result), content_type="application/json")

@csrf_exempt
def qqlogin(request):
    """a method for qq login"""

    #use the access_token to get the openid from qq server
    access_token = request.POST['access_token']
    payload = {'access_token': access_token}
    r = requests.get("https://graph.qq.com/oauth2.0/me", params = payload)
    callback = r.text
    if (callback.find("openid") == -1):
        result = __resultToJson('1', 'fail to get openid(useless accesstoken)', {})
        return HttpResponse(result, content_type = 'application/json')

    try:
        openid = str(callback.split("{")[1].split("}")[0].split(",")[1].split(":")[1].split("\"")[1])
    except:
       result = __resultToJson('1', 'fail to get openid', {})
       return HttpResponse(result, content_type = 'application/json')

    #get the userinfo according to the access_token and openid
    #TODO:this appid should be written in the conf file
    appid = "100510779"
    payload = {'access_token': access_token, 'oauth_consumer_key': appid, 'openid': openid}
    r = requests.get('https://graph.qq.com/user/get_user_info?', params = payload)
    userinfo = r.json()
    if ("nickname" in userinfo):
        count = User.objects.filter(uid = openid).count()
        if (count == 0):
            user = User(openid, userinfo['nickname'])
            user.save()
        request.session['mid'] = openid
        result = __resultToJson('0', '', {})
        return HttpResponse(result, content_type = 'application/json')
    else:
        result = __resultToJson('2', 'fail to get nickname', {})
        return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def sinalogin(request):
    """a method for sina login"""

    #use the access_token to get uid from sina server    
    #TODO:this appkey should be written in the conf file
    appkey = "2600055104"
    access_token = request.POST['access_token']
    payload = {'source': appkey, 'access_token': access_token}
    r = requests.get('https://api.weibo.com/2/account/get_uid.json', params = payload)
    response = r.json()
    if ("uid" in response):
        uid = response['uid']
    else:
        result = __resultToJson('1', 'fail to get uid', {})
        return HttpResponse(result, content_type = 'application/json')

    #get the userinfo according to the access_token and uid
    payload = {'source': appkey, 'access_token': access_token, 'uid': uid}
    r = requests.get('https://api.weibo.com/2/users/show.json', params = payload)
    userinfo = r.json()
    if ('name' in userinfo):
        count = User.objects.filter(uid = uid).count()
        if (count == 0):
            user = User(uid, userinfo['name'])
            user.save()
        request.session["mid"] = uid
        result = __resultToJson('0', '', {}) 
        return HttpResponse(result, content_type = 'application/json')
    else:
        result = __resultToJson('2', 'fail to get nickname', {})
        return HttpResponse(result, content_type = 'application/json')
        
@csrf_exempt
def reg(request):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    return HttpResponse("reg method")

@csrf_exempt
def createStory(request):
    """a method for an existing user to create a new story"""
    
    #a user cannot create a story before he login
    #if ("mid" not in request.session):
    #    result = __resultToJson('1', 'redirect to login page!', {})
    #    return HttpResponse(result, content_type = 'application/json')

    #authorId = request.session['mid']
    authorId = request.POST['author']
    if User.objects.filter(uid = authorId).exists():
        author = User.objects.get(uid = authorId)
    else:
        result = __resultToJson('1', "uid: %s does not exist" % authorId, {})
        return HttpResponse(result, content_type = 'application/json')

    #create start chapter
    startChap = Chapter()
    startChap.desc = request.POST['startChapDesc']
    startChap.author = author
    startChap.coauthor = author
    startChap.modeMask = request.POST['startChapModeMask']
    startChap.createTime = int(time.time())
    try:
        startChap.save()
    except:
        result = __resultToJson('2', repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')
    
    #create new story
    newStory = Story()
    newStory.title = request.POST['title']
    newStory.keysMask = int(request.POST['keysMask'])
    newStory.summary = request.POST['summary']
    newStory.author = author
    newStory.modeMask = int(request.POST['modeMask'])
    newStory.startChap = startChap
    newStory.createTime = int(time.time())
    newStory.timeStamp = int(time.time())
    try:
        newStory.save()
    except:
        result = __resultToJson('3', repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')

    #save the storyid for the startChapter
    startChap.storyId = newStory.stid
    startChap.save()

    #create the corresponding coauthorset
    coauthorStat = CoauthorsStatistics()
    coauthorStat.story = newStory
    coauthorStat.allCoauthorsSet = authorId
    coauthorStat.allCoauthorsNum = 1

    coauthorStat.today = authorId
    coauthorStat.weekCoauthorsSet = authorId
    coauthorStat.weekCoauthorsNum = 1
    try:
        coauthorStat.save()
    except:
        result = __resultToJson('3', repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')

    result = __resultToJson('0', '', {'stid': str(newStory.stid)})
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def createChapter(request):
    """a method for creating a chapter"""

    #a user cannot create a chapter before he login
    #if ('mid' not in request.session):
    #    result = __resultToJson('1', 'redirect to login page!', {})
    #    return HttpResponse(result, content_type = 'application/json')

    if User.objects.filter(uid = request.POST['coauthor']).exists():
        coauthor = User.objects.get(uid = request.POST['coauthor'])
    else:
        result = __resultToJson('9', "uid: %s does not exist" % request.POST['coauthor'], {})
        return HttpResponse(result, content_type = 'application/json')

    #create a new chapter
    newChapter = Chapter()
    newChapter.desc = request.POST['desc']
    newChapter.parentId = int(request.POST['parentId'])
    newChapter.children = ''    #blank, no children now
    newChapter.coauthor = coauthor
    newChapter.modeMask = int(request.POST['modeMask'])
    newChapter.createTime = int(time.time())
    newChapter.storyId = int(request.POST['storyId'])

    try:
        newChapter.save()
    except:
        result = __resultToJson('2', repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')
    
    #change the belonging story's timestamp
    if Story.objects.filter(stid = newChapter.storyId).exists():
        story = Story.objects.get(stid = newChapter.storyId)
    else:
        result = __resultToJson('3', "The new chapter's father story: #%s does not exist" % newChapter.storyId, {})
        return HttpResponse(result, content_type = 'application/json')
    story.timeStamp = int(time.time())
    try:
        story.save()
    except:
        result = __resultToJson('4', repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')
    
    #update the coauthorsStatistics
    if CoauthorsStatistics.objects.filter(story = story).exists():
        coauthorStat = CoauthorsStatistics.objects.get(story = story)
    else:
        result = __resultToJson('5', "the coauthorStatistics of story :#%d does not exit in db" % story.stid, {})
        return HttpResponse(result, content_type = 'application/json')
    allCoauthorsSet = set(coauthorStat.allCoauthorsSet.split(','))
    weekCoauthorsSet = set(coauthorStat.weekCoauthorsSet.split(','))
    today = set(coauthorStat.today.split(','))

    if (coauthor.uid not in allCoauthorsSet):
        allCoauthorsSet.add(coauthor.uid)
        weekCoauthorsSet.add(coauthor.uid)
        today.add(coauthor.uid)
        coauthorStat.allCoauthorsNum += 1
        coauthorStat.weekCoauthorsNum += 1
    elif (coauthor.uid not in weekCoauthorsSet):
        weekCoauthorsSet.add(coauthor.uid)
        today.add(coauthor.uid)
        coauthorStat.weekCoauthorsNum += 1
    elif (coauthor.uid not in today):
        today.add(coauthor.uid)

    coauthorStat.allCoauthorsSet = ','.join(uid for uid in allCoauthorsSet)
    coauthorStat.weekCoauthorsSet = ','.join(uid for uid in weekCoauthorsSet)
    coauthorStat.today = ','.join(uid for uid in today)

    try:
        coauthorStat.save()
    except:
        result = __resultToJson('6', repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')


    #get the parent chapter
    if Chapter.objects.filter(cpid = int(request.POST['parentId'])).exists():
        parentChapter = Chapter.objects.get(cpid = request.POST['parentId'])
    else:
        result = __resultToJson('1', "the chapter's parent chapter: #%s does not exist" % request.POST['parentId'], {})
        return HttpResponse(result, content_type = 'application/json')

    #add new chapter's id into parentChapter's children field
    brothers = parentChapter.children
    if (parentChapter.children == ''):
        parentChapter.children = str(newChapter.cpid)
    else:
        parentChapter.children = parentChapter.children + ',' + str(newChapter.cpid)
    parentChapter.save()

    #return result to client
    detail = {'newcpid': newChapter.cpid, 'brothers': brothers}
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def getStory(request, id):
    """a method for returning details of a story according to the story id"""

    if Story.objects.filter(stid = int(id)).exists():
        story = Story.objects.get(stid = int(id))
    else:
        result = __resultToJson('1', "story: #%s does not exist" % id, {})
        return HttpResponse(result, content_type = 'application/json')
    detail = {
        'title': story.title,
        'keysMask': story.keysMask,
        'summary': story.summary,
        'hot': story.hot,
        'support': story.support,
        'unsupport': story.unsupport,
        'author': story.author_id,
        'startChap': story.startChap_id,
        'modeMask': story.modeMask,
        'createTime': story.createTime,
        'timeStamp': story.timeStamp,
        'shareNum': story.shareNum,
        'collectNum': story.collectNum,
        'scanNum': story.scanNum
        }
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def getChapter(request, id):
    """a method for returning details of a chapter according to the chapter id"""

    if Chapter.objects.filter(cpid = int(id)).exists():
        chapter = Chapter.objects.get(cpid = int(id))
    else:
        result = __resultToJson('1', "chapter: #%s does not exist" % id, {})
        return HttpResponse(result, content_type = 'application/json')
    detail = {
        'desc': chapter.desc,
        'parentId': chapter.parentId,
        'children': chapter.children,
        'coauthor': chapter.coauthor_id,
        'support': chapter.support,
        'unsupport': chapter.unsupport,
        'modeMask': chapter.modeMask,
        'createTime': chapter.createTime,
        'scanNum': chapter.scanNum,
        'storyId': chapter.storyId
        }
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def getNextChapter(request, id):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    return HttpResponse("getNextChapter method, param -> id: %s" % id)

@csrf_exempt
def getPreChapter(request, id):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    return HttpResponse("getPreChapter method, param -> id: %s" % id)

@csrf_exempt
def getChildChapter(request, id):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    return HttpResponse("getChildChapter method, param -> id: %s" % id)

@csrf_exempt
def getChildrenChapters(request, id):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    return HttpResponse("getChildrenChapters method, param -> id: %s" % id)

@csrf_exempt
def getOffspring(request, id):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    return HttpResponse("getOffspring method, param -> id: %s" % id)

@csrf_exempt
def getStoryList(request, listType, start, count, timeStamp, startStoryId):
    """a method for returning the hottest/newest/quality story list"""

    listType = int (listType)
    start = int(start) - 1
    count = int(count)
    timeStamp = int(timeStamp)
    startStoryId = int(startStoryId)
    if (listType == 1):  #newest
        if (startStoryId == -1):
            stories = Story.objects.order_by('-createTime')[start : start+count]
        else:
            stories = Story.objects.filter(stid__lte = startStoryId).order_by('-createTime')[:count]
    elif (listType == 2):   #hottest
        coauthorStats = CoauthorsStatistics.objects.order_by('-weekCoauthorsNum')[start : start+count]
        storyIds = [obj.story_id for obj in coauthorStats]
        stories = [Story.objects.get(stid = storyId) for storyId in storyIds]
    elif (listType == 3):   #quality story
        coauthorStats = CoauthorsStatistics.objects.order_by('-allCoauthorsNum')[start : start+count]
        storyIds = [obj.story_id for obj in coauthorStats]
        stories = [Story.objects.get(stid = storyId) for storyId in storyIds]

    detail = {'stories' : []}
    for story in stories:
        if story.timeStamp >= timeStamp:
            curDetail = {
                        'storyid': story.stid,
                        'modify': 1,
                        'title': story.title,
                        'keysMask': story.keysMask,
                        'summary': story.summary,
                        'hot': story.hot,
                        'support': story.support,
                        'unsupport': story.unsupport,
                        'author': story.author_id,
                        'startChap': story.startChap_id,
                        'modeMask': story.modeMask,
                        'createTime': story.createTime,
                        'timeStamp': story.timeStamp,
                        'shareNum': story.shareNum,
                        'collectNum': story.collectNum,
                        'scanNum': story.scanNum
                        }
        else:
            curDetail = {'storyid': story.stid, 'modify': 0}
        for k in curDetail.keys():
            if not (type(curDetail[k]) == type('str')):
                curDetail[k] = str(curDetail[k])
        detail['stories'].append(curDetail)

    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

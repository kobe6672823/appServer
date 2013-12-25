from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from game.models import User, Chapter, Story
import requests
import json
import sys
import time
import logging
logger = logging.getLogger(__name__)

def __resultToJson(errorCode, errorMsg, detail):
    """a method for dump result into str for httpresponse"""

    result = {}
    result['code'] = errorCode
    result['msg'] = errorMsg
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
            user = User(openid, userinfo['nickname'], userinfo['figureurl'])
            user.save()
        request.session['mid'] = openid
        result = __resultToJson('0', '', {'imageUrl': userinfo['figureurl']})
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
            user = User(uid, userinfo['name'], userinfo['profile_image_url'])
            user.save()
        request.session["mid"] = uid
        result = __resultToJson('0', '', {'imageUrl': userinfo['profile_image_url']}) 
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
    if ("mid" not in request.session):
        result = __resultToJson('1', 'redirect to login page!', {})
        return HttpResponse(result, content_type = 'application/json')

    authorId = request.session['mid']
    #authorId = request.POST['author']
    if User.objects.filter(uid = authorId).exists():
        author = User.objects.get(uid = authorId)
    else:
        result = __resultToJson('1', "user doestnot exist", {})
        return HttpResponse(result, content_type = 'application/json')

    #create start chapter
    startChap = Chapter()
    startChap.desc = request.POST['startChapDesc']
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

    result = __resultToJson('0', '', {'stid': str(newStory.stid)})
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def createChapter(request):
    """a method for creating a chapter"""

    #a user cannot create a chapter before he login
    if ('mid' not in request.session):
        result = __resultToJson('1', 'redirect to login page!', {})
        return HttpResponse(result, content_type = 'application/json')

    if User.objects.filter(uid = request.session['mid']).exists():
        coauthor = User.objects.get(uid = request.session['mid'])
    else:
        result = __resultToJson('9', "user does not exist", {})
        return HttpResponse(result, content_type = 'application/json')

    #get the new chapter's brothers
    brotherChapters = Chapter.objects.filter(parentId = int(request.POST['parentId']))
    brotherIds = []
    for chapter in brotherChapters:
        brotherIds.append(str(chapter.cpid))

    #create a new chapter
    newChapter = Chapter()
    newChapter.desc = request.POST['desc']
    newChapter.parentId = int(request.POST['parentId'])
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
    
    #return result to client
    detail = {'newcpid': str(newChapter.cpid), 'brothers': (',').join(brotherIds)}
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

    author = User.objects.get(uid = story.author_id)
    detail = {
        'title': story.title,
        'keysMask': story.keysMask,
        'summary': story.summary,
        'hot': story.hot,
        'support': story.support,
        'unsupport': story.unsupport,
        'author_nickname': author.nickname,
        'author_imageUrl': author.imageUrl,
        'startChap': story.startChap_id,
        'modeMask': story.modeMask,
        'createTime': story.createTime,
        'timeStamp': story.timeStamp,
        'shareNum': story.shareNum,
        'collectNum': story.collectNum,
        'scanNum': story.scanNum
        }
    for k in detail.keys():
        if not(type(detail[k]) == type(u'ustr') or type(detail[k]) == type('str')): #if the data is not string or unicode_string, should change it into str
            detail[k] = str(detail[k])
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
    coauthor = User.objects.get(uid = chapter.coauthor_id)
    detail = {
        'desc': chapter.desc,
        'parentId': chapter.parentId,
        'author_nickname': coauthor.nickname,
        'author_imageUrl': coauthor.imageUrl,
        'support': chapter.support,
        'unsupport': chapter.unsupport,
        'modeMask': chapter.modeMask,
        'createTime': chapter.createTime,
        'shareNum': chapter.shareNum,
        'collectNum': chapter.collectNum,
        'scanNum': chapter.scanNum,
        'storyId': chapter.storyId
        }
    for k in detail.keys():
        if not(type(detail[k]) == type(u'ustr') or type(detail[k]) == type('str')):
            detail[k] = str(detail[k])
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

def __getChapterDetails(chapters, timeStamp):
    """a method for encapsulating the stories into hash"""

    detail = {'chapters' : []}
    for chapter in chapters:
        author = User.objects.get(uid = chapter.coauthor_id)
        curDetail = {
            'desc': chapter.desc,
            'parentId': chapter.parentId,
            'author_nickname': author.nickname,
            'author_imageUrl': author.imageUrl,
            'support': chapter.support,
            'unsupport': chapter.unsupport,
            'modeMask': chapter.modeMask,
            'createTime': chapter.createTime,
            'shareNum': chapter.shareNum,
            'collectNum': chapter.collectNum,
            'scanNum': chapter.scanNum,
            'storyId': chapter.storyId
            }
        for k in curDetail.keys():
            if not (type(curDetail[k]) == type(u'ustr') or type(curDetail[k]) == type('str')):
                curDetail[k] = str(curDetail[k])
        detail['chapters'].append(curDetail)
    return detail

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
def getSubChildren(request):
    #TODO: NEEDED_TO_BE_IMPLEMENTED
    reqParentId = int(request.GET['parentId'])
    reqStartId = int(request.GET['startId'])
    reqCount = int(request.GET['count'])
    
    if reqStartId == -1: #get from first 
        chapters = Chapter.objects.filter(parentId = reqParentId)[:reqCount]
    else:
        chapters = Chapter.objects.filter(parentId = reqParentId).filter(cpid__gt = reqStartId)[:reqCount]


    allNum = Chapter.objects.filter(parentId = reqParentId).count()
    reqNum = chapters.count()     
    detail = __getChapterDetails(chapters, 0)
    
    detail['reqNum'] = str(reqNum)
    detail['allNum'] = str(allNum)

    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')
    
    
    #return HttpResponse("getOffspring method, param -> parentId: %s, startId: %s, count: %s" % (parentId,startId,count))

def __getStoryDetails(stories, timeStamp):
    """a method for encapsulating the stories into hash"""

    detail = {'stories' : []}
    for story in stories:
        if story.timeStamp >= timeStamp:
            author = User.objects.get(uid = story.author_id)
            curDetail = {
                            'storyid': story.stid,
                            'modify': 1,
                            'title': story.title,
                            'keysMask': story.keysMask,
                            'summary': story.summary,
                            'hot': story.hot,
                            'support': story.support,
                            'unsupport': story.unsupport,
                            'author_nickname': author.nickname,
                            'author_imageUrl': author.imageUrl,
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
            if not (type(curDetail[k]) == type(u'ustr') or type(curDetail[k]) == type('str')):
                curDetail[k] = str(curDetail[k])
        detail['stories'].append(curDetail)
    return detail

@csrf_exempt
def newestStoryList(request):
    """a method for getting the newest story list to the frontend"""
    
    startStoryId = int(request.GET['startStoryId'])
    count = int(request.GET['count'])
    if startStoryId == -1:  #first newest story request
        stories = Story.objects.order_by('-createTime')[:count]
    else:   #follow-up request, use startStoryId to filter the newer story
        stories = Story.objects.filter(stid__lt = startStoryId).order_by('-createTime')[:count]

    detail = __getStoryDetails(stories, int(request.GET['timeStamp']))
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def hottestStoryList(request):
    """a method for getting the hottest story list to the frontend"""

    start = int(request.GET['start'])
    count = int(request.GET['count'])
    stories = Story.objects.order_by('-weekCoauthorNum')[start-1 : start-1+count]

    detail = __getStoryDetails(stories, int(request.GET['timeStamp']))
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def qualityStoryList(request):
    """a method for getting the quality story list"""

    start = int(request.GET['start'])
    count = int(request.GET['count'])
    stories = Story.objects.order_by('-allCoauthorNum')[start-1 : start-1+count]

    detail = __getStoryDetails(stories, int(request.GET['timeStamp']))
    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')


@csrf_exempt
def statistics(request):
    """a method for counting the story's/chapter's sharenum/collectnum/scannum"""
    
    type = int(request.POST['type'])
    storyId = int (request.POST['storyId'])
    if Story.objects.filter(stid = storyId).exists():
        story = Story.objects.get(stid = storyId)
    else:
        result = __resultToJson('1', "story: #%d does not exist" % storyId, {})
        return HttpResponse(result, content_type = 'application/json')

    if 'chapterId' in request.POST:
        chapterId = int (request.POST['chapterId'])
    else:
        chapterId = -1

    if chapterId > -1:
        if Chapter.objects.filter(cpid = chapterId).exists():
            chapter = Chapter.objects.get(cpid = chapterId)
        else:
            result = __resultToJson('1', "chapter: #%d does not exist" % chapterId, {})
            return HttpResponse(result, content_type = 'application/json')

    if type == 1:   #counting shareNum
        story.shareNum += 1
        if chapterId > -1:
            chapter.shareNum += 1
    elif type == 2:  #counting collectNum
        story.collectNum += 1
        if chapterId > -1:
            chapter.collectNum += 1
    elif type == 3:  #counting scanNum
        story.scanNum += 1
        if chapterId > -1:
            chapter.scanNum += 1

    story.save()
    if chapterId > -1:
        chapter.save()

    result = __resultToJson('0', '', {})
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def checkStoryUpdate(request):
    """a method for checking the storys in the list is updated or not"""

    storyList = request.POST['Ids'].split(',')
    timeStampList = request.POST['timeStamps'].split(',')
    returnList = []
    cnt = 0
    pos = 0
    for id in storyList:
        if Story.objects.filter(stid = int (id)).exists():
            story = Story.objects.get(stid = int(id))
            if story.timeStamp > int(timeStampList[pos]):
                cnt += 1
                returnList.append(str(story.stid))
        pos += 1
    detail = {
        'count' : cnt,
        'storyList' : ','.join(returnList),
    }

    result = __resultToJson('0', '', detail)
    return HttpResponse(result, content_type = 'application/json')

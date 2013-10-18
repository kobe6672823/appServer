from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from game.models import User, Chapter, Story
import requests
import json
import sys
import time

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
        result = __resultToJson(1, 'fail to get openid', {})
        return HttpResponse(result, content_type = 'application/json')

    try:
        openid = str(callback.split("{")[1].split("}")[0].split(",")[1].split(":")[1].split("\"")[1])
    except:
       result = __resultToJson(1, 'fail to get openid', {})
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
        result = __resultToJson(0, '', {})
        return HttpResponse(result, content_type = 'application/json')
    else:
        result = __resultToJson(2, 'fail to get nickname', {})
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
        result = __resultToJson(1, 'fail to get uid', {})
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
        result = __resultToJson(0, '', {}) 
        return HttpResponse(result, content_type = 'application/json')
    else:
        result = __resultToJson(2, 'fail to get nickname', {})
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
        result = __resultToJson(1, 'redirect to login page!', {})
        return HttpResponse(result, content_type = 'application/json')

    authorId = request.session['mid']
    try:
        author = User.objects.get(uid = authorId)
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
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
        result = __resultToJson(2, repr(sys.exc_info()[0]), {})
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
        result = __resultToJson(3, repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')

    #save the storyid for the startChapter
    startChap.storyId = newStory.stid
    startChap.save()
    result = __resultToJson(0, '', {'stid': newStory.stid})
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def createChapter(request):
    """a method for creating a chapter"""

    #a user cannot create a chapter before he login
    if ('mid' not in request.session):
        result = __resultToJson(1, 'redirect to login page!', {})
        return HttpResponse(result, content_type = 'application/json')

    try:
        coauthor = User.objects.get(uid = request.session['mid'])
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')

    #create a new chapter
    newChapter = Chapter()
    newChapter.desc = request.POST['desc']
    newChapter.parentId = request.POST['parentId']
    newChapter.children = ''    #blank, no children now
    newChapter.coauthor = coauthor
    newChapter.modeMask = request.POST['modeMask']
    newChapter.createTime = int(time.time())
    newChapter.storyId = request.POST['storyId']

    try:
        newChapter.save()
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')
    
    #change the belong story's timestamp
    try:
        story = Story.objects.get(stid = int(newChapter.storyId))
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')
    story.timeStamp = int(time.time())
    try:
        story.save()
    except:
        result = __resultToJson(3, repr(sys.exc_info()[0]), {})
        return HttpResponse(result, content_type = 'application/json')

    #get the parent chapter
    try:
        parentChapter = Chapter.objects.get(cpid = request.POST['parentId'])
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
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
    result = __resultToJson(0, '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def getStory(request, id):
    """a method for returning details of a story according to the story id"""

    try:
        story = Story.objects.get(stid = int(id))
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
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
    result = __resultToJson(0, '', detail)
    return HttpResponse(result, content_type = 'application/json')

@csrf_exempt
def getChapter(request, id):
    """a method for returning details of a chapter according to the chapter id"""

    try:
        chapter = Chapter.objects.get(cpid = int(id))
    except:
        result = __resultToJson(1, repr(sys.exc_info()[0]), {})
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
    result = __resultToJson(0, '', detail)
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

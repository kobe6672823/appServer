from django.conf.urls import patterns, url

from game import views

urlpatterns = patterns('',
    url(r'^qqlogin/?$', views.qqlogin, name='qqlogin'),
    url(r'^sinalogin/?$', views.sinalogin, name='sinalogin'),
    url(r'^reg/?$', views.reg, name='reg'),

    url(r'^story/create/?$', views.createStory, name='createStory'),
    url(r'^chapter/create/?$', views.createChapter, name='createChapter'),
    url(r'^story/(?P<id>\d+)/?$', views.getStory, name='getStory'),
    url(r'^coauthorOfStory/?$', views.getCoauthorOfStory, name='getCoauthorOfStory'),
    url(r'^chapter/(?P<id>\d+)/?$', views.getChapter, name='getChapter'),
    url(r'^chapter/(?P<id>\d+)/next/?$', views.getNextChapter, name='getNextChapter,'),
    url(r'^chapter/(?P<id>\d+)/pre/?$', views.getPreChapter, name='getPreChapter'),
    url(r'^chapter/(?P<id>\d+)/child/?$', views.getChildChapter, name='getChildChapter'),
    url(r'^chapter/(?P<id>\d+)/children/?$', views.getChildrenChapters, name='getChildrenChapters'),
    #url(r'^storyList/(?P<listType>\d+)/(?P<start>\d+)/(?P<count>\d+)/(?P<timeStamp>\d+)/(?P<startStoryId>-?\d+)/?$', views.getStoryList, name='getStoryList'),
    url(r'^newestStoryList/?$', views.newestStoryList, name='newestStoryList'),
    url(r'^hottestStoryList/?$', views.hottestStoryList, name='hottestStoryList'),
    url(r'^qualityStoryList/?$', views.qualityStoryList, name='qualityStoryList'),
    url(r'^subChildrenOfChapter/?$', views.getSubChildren, name='getSubChildren'),
    #url(r'^chapter/(?P<id>\d+)/offspring/?$', views.getOffspring, name='getOffspring'),
    #url(r'^chapter/(?P<parentId>\d+)/(?P<startId>\d+)/(?P<count>\d+)/?$', views.getSubChildren, name='getSubChildren'),
    url(r'^statistics/?$', views.statistics, name='statistics'),

    url(r'^update/CheckStoryIsUpdated/?$', views.checkStoryUpdate, name='checkStoryUpdate'),
    url(r'^update/CheckStoryList/?$', views.checkStoryListUpdate, name='checkStoryListUpdate'),
    url(r'^update/CheckAsCoauthor/?$', views.checkAsCoauthorUpdate, name='checkAsCoauthorUpdate'),
    url(r'^update/CheckAsAuthor/?$', views.checkAsAuthorUpdate, name='checkAsAuthorUpdate'),

    url(r'^saveToken/?$', views.saveToken, name='saveToken'),
)


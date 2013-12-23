#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

print "get quality storyList(start == 1, count==5), request the 1-5 quality story"
payload = {'count':5, 'timeStamp':0, 'start':1}
r = requests.get('http://127.0.0.1:8000/qualityStoryList', params=payload)
print r.text

print

print "get quality storyList(start == 6, count==5), request the 6-10 quality story"
payload = {'count':5, 'timeStamp':1384345400, 'start':6}
r = requests.get('http://127.0.0.1:8000/qualityStoryList', params=payload)
print r.text

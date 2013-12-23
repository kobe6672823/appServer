#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

print "get newest storyList(startStoryId == -1), it means first request!"
payload = {'count':5, 'timeStamp':0, 'startStoryId':-1}
r = requests.get('http://127.0.0.1:8000/newestStoryList', params=payload)
print r.text

print

print "get newest storyList(startStoryId != -1), it means the follow-up request!"
payload = {'count':5, 'timeStamp':1384345400, 'startStoryId':6}
r = requests.get('http://127.0.0.1:8000/newestStoryList', params=payload)
print r.text

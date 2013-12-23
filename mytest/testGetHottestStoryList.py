#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

print "get hottest storyList(start == 1, count==5), request the 1-5 hottest story"
payload = {'count':5, 'timeStamp':0, 'start':1}
r = requests.get('http://127.0.0.1:8000/hottestStoryList', params=payload)
print r.text

print

print "get newest storyList(start == 6, count==5), request the 6-10 hottest story"
payload = {'count':5, 'timeStamp':1384345400, 'start':6}
r = requests.get('http://127.0.0.1:8000/hottestStoryList', params=payload)
print r.text

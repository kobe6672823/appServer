#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

print "type == 1(shareNum), has chapter"
payload = {'type': 1,
           'storyId': 3,
	       'userId': '2064502873',
	       'chapterId': 19
          }
r = requests.post('http://127.0.0.1:8000/statistics', data = payload)
print r.text

print "type == 1(shareNum), no chapter"
payload = {'type': 1,
           'storyId': 3,
           'userId': '2064502873',
           }
r = requests.post('http://127.0.0.1:8000/statistics', data = payload)
print r.text

print "type == 2(collectNum), has chapter"
payload = {'type': 2,
           'storyId': 3,
           'userId': '2064502873',
           'chapterId': 19
           }
r = requests.post('http://127.0.0.1:8000/statistics', data = payload)
print r.text

print "type == 2(collectNum), no chapter"
payload = {'type': 2,
           'storyId': 3,
           'userId': '2064502873',
           }                                
r = requests.post('http://127.0.0.1:8000/statistics', data = payload)
print r.text

print "type == 3(scanNum), has chapter"
payload = {'type': 3,
           'storyId': 3,
           'userId': '2064502873',
           'chapterId': 19
           }
r = requests.post('http://127.0.0.1:8000/statistics', data = payload)
print r.text

print "type == 3(scanNum), no chapter"
payload = {'type': 3,
           'storyId': 3,
           'userId': '2064502873',
           }                                
r = requests.post('http://127.0.0.1:8000/statistics', data = payload)
print r.text

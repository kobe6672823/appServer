#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

print "get subChildren of chapter (parentId == 1, startId == -1, count==2)"
payload = {'parentId':1, 'count':2, 'startId':-1}
r = requests.get('http://127.0.0.1:8000/subChildrenOfChapter', params=payload)
print r.text

print ""

print "get subChildren of chapter (parentId == 2, startId == -1, count==5)"
payload = {'parentId':2, 'count':5, 'startId':-1}
r = requests.get('http://127.0.0.1:8000/subChildrenOfChapter', params=payload)
print r.text

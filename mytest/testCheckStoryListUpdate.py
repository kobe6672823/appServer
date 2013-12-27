#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

payload = {
           'storyIds': '3,4, 6, 8',
	       'timeStamp': '0'
          }
r = requests.get('http://127.0.0.1:8000/update/CheckStoryList/', params = payload)
print r.text



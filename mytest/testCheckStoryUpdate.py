#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

payload = {'count': 100,
           'Ids': '3,4, 6, 8',
	       'timeStamps': '2384935967, 0, 0, 0'
          }
r = requests.post('http://127.0.0.1:8000/update/CheckStoryIsUpdated', data = payload)
print r.text



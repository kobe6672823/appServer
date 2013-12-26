#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

payload = {'storyId':3, 'count':5}
r = requests.get('http://127.0.0.1:8000/coauthorOfStory', params = payload)
print r.text


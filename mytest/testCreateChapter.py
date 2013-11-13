#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

#before logined
r = requests.post('http://127.0.0.1:8000/chapter/create')
print repr(r.json)

#login
payload = {'access_token': "2.008V8iPCeGZxpCb6cb2cbd90rNR1HD"}
r = requests.post('http://127.0.0.1:8000/sinalogin/', data = payload)

#after login
sessionid = r.cookies['sessionid']
cookies = {'sessionid': sessionid}
payload = {
    'parentId': 19,
	'modeMask': 1,
	'desc': 'test create new chapter',
    'storyId': 3
          }
r = requests.post('http://127.0.0.1:8000/chapter/create', cookies = cookies, data = payload)
print r.text


#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

#before logined
r = requests.post('http://127.0.0.1:8000/story/create')
print r.text

#login
payload = {'access_token': "2.008V8iPCeGZxpCb6cb2cbd90rNR1HD"}
r = requests.post('http://127.0.0.1:8000/sinalogin/', data = payload)
print r.text

#after login
sessionid = r.cookies['sessionid']
cookies = {'sessionid': sessionid}
payload = {'title': 'abc',
           'summary': 'only a test',
	   'author': '1577',
	   'keysMask': 100,
	   'modeMask': 1,
	   'startChapDesc': 'start chap',
	   'startChapModeMask': 1
          }
r = requests.post('http://127.0.0.1:8000/story/create', cookies = cookies, data = payload)
print r.text


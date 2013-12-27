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
payload = {
    'timeStamp': '1388130358',
          }
r = requests.get('http://127.0.0.1:8000/update/CheckAsCoauthor/', cookies = cookies, params = payload)
print r.text


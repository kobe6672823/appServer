#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

payload = {'access_token': "2.008V8iPCeGZxpCb6cb2cbd90rNR1HD"}
r = requests.post('http://127.0.0.1:8000/sinalogin/', data = payload)
print repr(r.text)

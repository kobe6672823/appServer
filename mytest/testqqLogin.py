#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

payload = {"access_token": "CA1CCAE89E13EC710DA88378A40BE5CF"}
r = requests.post('http://127.0.0.1:8000/qqlogin/', data = payload)
print r.text


#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

payload = {
            'deviceToken': 'qwertyuioplkjhgfdsazxcvbnm123456',
          }
r = requests.post('http://127.0.0.1:8000/saveToken/', data = payload)
print r.text


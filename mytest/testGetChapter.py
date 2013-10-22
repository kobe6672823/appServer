#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

r = requests.post('http://127.0.0.1:8000/chapter/25')
print r.text


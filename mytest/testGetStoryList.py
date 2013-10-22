#! /usr/bin/python 
# -*- coding: utf-8 -*-

import requests
import json

print "get newest storyList(startStoryId == -1)"
r = requests.post('http://127.0.0.1:8000/storyList/1/1/30/1382325817/-1')
print r.text

print "get newest storyList(startStoryId == 3)"
r = requests.post('http://127.0.0.1:8000/storyList/1/1/30/1382325817/3')
print r.text

print "get hottest storyList(start == 1)"
r = requests.post('http://127.0.0.1:8000/storyList/2/1/30/1382325817/-1')
print r.text

print "get hottest storyList(start == 100)"
r = requests.post('http://127.0.0.1:8000/storyList/2/100/30/1382325817/-1')
print r.text

print "get quality storyList(start == 1)"
r = requests.post('http://127.0.0.1:8000/storyList/3/1/30/1382325817/-1')
print r.text

print "get quality storyList(start == 100)"
r = requests.post('http://127.0.0.1:8000/storyList/3/1/30/1382325817/-1')
print r.text

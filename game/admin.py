#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.contrib import admin
from game.models import User, Story, Chapter, IOSDeviceToken

admin.site.register(User)
admin.site.register(Story)
admin.site.register(Chapter)
admin.site.register(IOSDeviceToken)

#!/usr/bin/python
# -*- coding: utf-8 -*-
from django.db import models
from .fields import BigAutoField
import time

class User(models.Model):
    uid = models.CharField(primary_key = True, max_length = 50, help_text = '识别用户唯一id')
    nickname = models.CharField(max_length = 30, help_text = '用户昵称')
    imageUrl = models.CharField(max_length = 200, help_text = '用户头像url')
    
    def __unicode__(self):
        return self.uid

class Chapter(models.Model):
    cpid = BigAutoField(primary_key=True, null = False, help_text = '章节ID')
    desc = models.TextField(help_text = '章节内容')
    parentId = models.PositiveIntegerField(default = 0, help_text = '父亲节点的ID')
    #parentId = models.ForeignKey('self', default = 0, blank=True, null=True, help_text = '父亲节点的ID')
    #children = models.TextField(blank = True, help_text = '用逗号分割开的cpid序列')
    coauthor = models.ForeignKey('User', related_name = 'chapter_author', help_text = '章节作者')
    support = models.PositiveIntegerField(default = 0, help_text = '赞的人数')
    unsupport = models.PositiveIntegerField(default = 0, help_text = '踩的人数')
    modeMask = models.IntegerField(help_text = '权限类型的|值.(是否允许其他人进行编辑或续写)')
    createTime = models.BigIntegerField(default = int(time.time()), null = False, help_text = '章节创建时间')
    shareNum = models.PositiveIntegerField(default = 0, help_text = '分享数')
    collectNum = models.PositiveIntegerField(default = 0, help_text = '收藏数')
    scanNum = models.PositiveIntegerField(default = 0, help_text = '浏览数')
    storyId = models.BigIntegerField(default = 0, blank = True, null = True, help_text = '所属故事id')

    def __unicode__(self):
        return self.desc

class Story(models.Model):
    stid = BigAutoField(primary_key=True, null = False, help_text = '故事ID')
    title = models.CharField(max_length = 100, help_text = '故事名')
    keysMask = models.IntegerField(help_text = '故事类型(武侠/魔幻/都市等)的|值')
    summary = models.TextField(help_text = '故事摘要')
    hot = models.IntegerField(default = 0, help_text = '玩过的人数')
    support = models.PositiveIntegerField(default = 0, help_text = '赞的人数')
    unsupport = models.PositiveIntegerField(default = 0, help_text = '踩的人数')
    author = models.ForeignKey('User', help_text = '故事原创作者')
    modeMask = models.IntegerField(help_text = '权限类型的|值(是否允许其他人进行编辑或续写)')
    chapNum = models.PositiveIntegerField(default = 1, help_text = '故事章节数')
    startChap = models.OneToOneField('Chapter')
    timeStamp = models.BigIntegerField(default = int(time.time()), null = False, help_text = '故事最后更新时间')
    createTime = models.BigIntegerField(default = int(time.time()), null = False, help_text = '故事创建时间')
    shareNum = models.PositiveIntegerField(default = 0, help_text = '分享数')
    collectNum = models.PositiveIntegerField(default = 0, help_text = '收藏数')
    scanNum = models.PositiveIntegerField(default = 0, help_text = '浏览数')
    allCoauthorNum = models.PositiveIntegerField(default = 0, help_text = '历史总参与人数')
    weekCoauthorNum = models.PositiveIntegerField(default = 0, help_text = '本周参与人数')
    
    def __unicode__(self):
        return self.title

class IOSDeviceToken(models.Model):
    token = models.CharField(primary_key = True, null = False, max_length = 32, help_text = 'IOSDeviceToken')
    
    def __unicode__(self):
        return self.token

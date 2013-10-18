# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'Chapter.storyid'
        db.delete_column(u'game_chapter', 'storyid')

        # Adding field 'Chapter.storyId'
        db.add_column(u'game_chapter', 'storyId',
                      self.gf('django.db.models.fields.BigIntegerField')(default=0, null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Adding field 'Chapter.storyid'
        db.add_column(u'game_chapter', 'storyid',
                      self.gf('django.db.models.fields.BigIntegerField')(default=0, null=True, blank=True),
                      keep_default=False)

        # Deleting field 'Chapter.storyId'
        db.delete_column(u'game_chapter', 'storyId')


    models = {
        u'game.chapter': {
            'Meta': {'object_name': 'Chapter'},
            'children': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'coauthor': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'chapter_author'", 'to': u"orm['game.User']"}),
            'cpid': ('game.fields.BigAutoField', [], {'primary_key': 'True'}),
            'createTime': ('django.db.models.fields.BigIntegerField', [], {'default': '1382061883'}),
            'desc': ('django.db.models.fields.TextField', [], {}),
            'modeMask': ('django.db.models.fields.IntegerField', [], {}),
            'parentId': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'scanNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'storyId': ('django.db.models.fields.BigIntegerField', [], {'default': '0', 'null': 'True', 'blank': 'True'}),
            'support': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'unsupport': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'})
        },
        u'game.coauthorsstatistics': {
            'Meta': {'object_name': 'CoauthorsStatistics'},
            'allCoauthorsNum': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'allCoauthorsSet': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'fiveDBefore': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'fourDBefore': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'oneDBefore': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'sixDBefore': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'story': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['game.Story']", 'unique': 'True'}),
            'threeDBefore': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'today': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'twoDBefore': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'weekCoauthorsNum': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'weekCoauthorsSet': ('django.db.models.fields.TextField', [], {'blank': 'True'})
        },
        u'game.story': {
            'Meta': {'object_name': 'Story'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['game.User']"}),
            'chapNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '1'}),
            'collectNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'createTime': ('django.db.models.fields.BigIntegerField', [], {'default': '1382061883'}),
            'hot': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'keysMask': ('django.db.models.fields.IntegerField', [], {}),
            'modeMask': ('django.db.models.fields.IntegerField', [], {}),
            'scanNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'shareNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'startChap': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['game.Chapter']", 'unique': 'True'}),
            'stid': ('game.fields.BigAutoField', [], {'primary_key': 'True'}),
            'summary': ('django.db.models.fields.TextField', [], {}),
            'support': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'timeStamp': ('django.db.models.fields.BigIntegerField', [], {'default': '1382061883'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'unsupport': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'})
        },
        u'game.user': {
            'Meta': {'object_name': 'User'},
            'nickname': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'uid': ('django.db.models.fields.CharField', [], {'max_length': '50', 'primary_key': 'True'})
        }
    }

    complete_apps = ['game']
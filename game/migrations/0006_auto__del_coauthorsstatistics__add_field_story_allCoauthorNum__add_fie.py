# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'CoauthorsStatistics'
        db.delete_table(u'game_coauthorsstatistics')

        # Adding field 'Story.allCoauthorNum'
        db.add_column(u'game_story', 'allCoauthorNum',
                      self.gf('django.db.models.fields.PositiveIntegerField')(default=0),
                      keep_default=False)

        # Adding field 'Story.weekCoauthorNum'
        db.add_column(u'game_story', 'weekCoauthorNum',
                      self.gf('django.db.models.fields.PositiveIntegerField')(default=0),
                      keep_default=False)

        # Adding field 'User.imageUrl'
        db.add_column(u'game_user', 'imageUrl',
                      self.gf('django.db.models.fields.CharField')(default='http', max_length=200),
                      keep_default=False)


    def backwards(self, orm):
        # Adding model 'CoauthorsStatistics'
        db.create_table(u'game_coauthorsstatistics', (
            ('weekCoauthorsNum', self.gf('django.db.models.fields.BigIntegerField')(default=0)),
            ('oneDBefore', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('threeDBefore', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('weekCoauthorsSet', self.gf('django.db.models.fields.TextField')(blank=True)),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('sixDBefore', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('allCoauthorsSet', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('story', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['game.Story'], unique=True)),
            ('fourDBefore', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('fiveDBefore', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('allCoauthorsNum', self.gf('django.db.models.fields.BigIntegerField')(default=0)),
            ('twoDBefore', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('today', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'game', ['CoauthorsStatistics'])

        # Deleting field 'Story.allCoauthorNum'
        db.delete_column(u'game_story', 'allCoauthorNum')

        # Deleting field 'Story.weekCoauthorNum'
        db.delete_column(u'game_story', 'weekCoauthorNum')

        # Deleting field 'User.imageUrl'
        db.delete_column(u'game_user', 'imageUrl')


    models = {
        u'game.chapter': {
            'Meta': {'object_name': 'Chapter'},
            'coauthor': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'chapter_author'", 'to': u"orm['game.User']"}),
            'collectNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'cpid': ('game.fields.BigAutoField', [], {'primary_key': 'True'}),
            'createTime': ('django.db.models.fields.BigIntegerField', [], {'default': '1387444158'}),
            'desc': ('django.db.models.fields.TextField', [], {}),
            'modeMask': ('django.db.models.fields.IntegerField', [], {}),
            'parentId': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'scanNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'shareNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'storyId': ('django.db.models.fields.BigIntegerField', [], {'default': '0', 'null': 'True', 'blank': 'True'}),
            'support': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'unsupport': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'})
        },
        u'game.story': {
            'Meta': {'object_name': 'Story'},
            'allCoauthorNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['game.User']"}),
            'chapNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '1'}),
            'collectNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'createTime': ('django.db.models.fields.BigIntegerField', [], {'default': '1387444158'}),
            'hot': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'keysMask': ('django.db.models.fields.IntegerField', [], {}),
            'modeMask': ('django.db.models.fields.IntegerField', [], {}),
            'scanNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'shareNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'startChap': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['game.Chapter']", 'unique': 'True'}),
            'stid': ('game.fields.BigAutoField', [], {'primary_key': 'True'}),
            'summary': ('django.db.models.fields.TextField', [], {}),
            'support': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'timeStamp': ('django.db.models.fields.BigIntegerField', [], {'default': '1387444158'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'unsupport': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'weekCoauthorNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'})
        },
        u'game.user': {
            'Meta': {'object_name': 'User'},
            'imageUrl': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'nickname': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'uid': ('django.db.models.fields.CharField', [], {'max_length': '50', 'primary_key': 'True'})
        }
    }

    complete_apps = ['game']
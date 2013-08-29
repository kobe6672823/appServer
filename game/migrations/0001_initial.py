# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'User'
        db.create_table(u'game_user', (
            ('uid', self.gf('django.db.models.fields.CharField')(max_length=50, primary_key=True)),
            ('nickname', self.gf('django.db.models.fields.CharField')(max_length=30)),
        ))
        db.send_create_signal(u'game', ['User'])

        # Adding model 'Chapter'
        db.create_table(u'game_chapter', (
            ('cpid', self.gf('game.fields.BigAutoField')(primary_key=True)),
            ('desc', self.gf('django.db.models.fields.TextField')()),
            ('parentId', self.gf('django.db.models.fields.PositiveIntegerField')(default=0)),
            ('children', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('coauthor', self.gf('django.db.models.fields.related.ForeignKey')(related_name='chapter_author', to=orm['game.User'])),
            ('support', self.gf('django.db.models.fields.PositiveIntegerField')(default=0)),
            ('unsupport', self.gf('django.db.models.fields.PositiveIntegerField')(default=0)),
            ('modeMask', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'game', ['Chapter'])

        # Adding model 'Story'
        db.create_table(u'game_story', (
            ('stid', self.gf('game.fields.BigAutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('keysMask', self.gf('django.db.models.fields.IntegerField')()),
            ('summary', self.gf('django.db.models.fields.TextField')()),
            ('hot', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('support', self.gf('django.db.models.fields.PositiveIntegerField')(default=0)),
            ('unsupport', self.gf('django.db.models.fields.PositiveIntegerField')(default=0)),
            ('author', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['game.User'])),
            ('modeMask', self.gf('django.db.models.fields.IntegerField')()),
            ('chapNum', self.gf('django.db.models.fields.PositiveIntegerField')(default=1)),
            ('startChap', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['game.Chapter'], unique=True)),
        ))
        db.send_create_signal(u'game', ['Story'])


    def backwards(self, orm):
        # Deleting model 'User'
        db.delete_table(u'game_user')

        # Deleting model 'Chapter'
        db.delete_table(u'game_chapter')

        # Deleting model 'Story'
        db.delete_table(u'game_story')


    models = {
        u'game.chapter': {
            'Meta': {'object_name': 'Chapter'},
            'children': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'coauthor': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'chapter_author'", 'to': u"orm['game.User']"}),
            'cpid': ('game.fields.BigAutoField', [], {'primary_key': 'True'}),
            'desc': ('django.db.models.fields.TextField', [], {}),
            'modeMask': ('django.db.models.fields.IntegerField', [], {}),
            'parentId': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'support': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'unsupport': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'})
        },
        u'game.story': {
            'Meta': {'object_name': 'Story'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['game.User']"}),
            'chapNum': ('django.db.models.fields.PositiveIntegerField', [], {'default': '1'}),
            'hot': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'keysMask': ('django.db.models.fields.IntegerField', [], {}),
            'modeMask': ('django.db.models.fields.IntegerField', [], {}),
            'startChap': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['game.Chapter']", 'unique': 'True'}),
            'stid': ('game.fields.BigAutoField', [], {'primary_key': 'True'}),
            'summary': ('django.db.models.fields.TextField', [], {}),
            'support': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
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
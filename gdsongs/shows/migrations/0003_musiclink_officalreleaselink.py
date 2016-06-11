# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shows', '0002_auto_20151208_0732'),
    ]

    operations = [
        migrations.CreateModel(
            name='MusicLink',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('link', models.URLField()),
                ('text', models.CharField(max_length=200)),
                ('music_type', models.PositiveSmallIntegerField(choices=[(0, b'Soundboard'), (1, b'Audience'), (2, b'Matrix'), (3, b'Video')])),
                ('show', models.ForeignKey(to='shows.Show')),
            ],
        ),
        migrations.CreateModel(
            name='OfficalReleaseLink',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('link', models.URLField()),
                ('text', models.CharField(max_length=200)),
                ('show', models.ForeignKey(to='shows.Show')),
            ],
        ),
    ]

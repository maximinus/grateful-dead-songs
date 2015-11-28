# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('songs', '0001_initial'),
        ('venues', '0002_auto_20151128_0648'),
    ]

    operations = [
        migrations.CreateModel(
            name='PlayedSet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order', models.IntegerField(default=1)),
                ('encore', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='PlayedSong',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order', models.IntegerField(default=0)),
                ('length', models.IntegerField(default=0)),
                ('comments', models.TextField(blank=True)),
                ('played_set', models.ForeignKey(to='shows.PlayedSet')),
                ('song', models.ForeignKey(to='songs.Song')),
            ],
        ),
        migrations.CreateModel(
            name='Show',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order', models.IntegerField(default=0)),
                ('time_started', models.TimeField(null=True)),
                ('time_ended', models.TimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ShowDate',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('year', models.IntegerField(default=0)),
                ('month', models.IntegerField(default=0)),
                ('day', models.IntegerField(default=0)),
                ('exact_date', models.DateField(default=None, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='show',
            name='date',
            field=models.ForeignKey(to='shows.ShowDate'),
        ),
        migrations.AddField(
            model_name='show',
            name='venue',
            field=models.ForeignKey(to='venues.Venue'),
        ),
        migrations.AddField(
            model_name='playedset',
            name='show',
            field=models.ForeignKey(to='shows.Show'),
        ),
    ]

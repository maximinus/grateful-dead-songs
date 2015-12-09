grateful-dead-songs
===================

Website for Grateful Dead songs information.

All code & design (C)Copr. 2016, Chris Handy

This code is licensed under GPL3.

To test and run:

1: Install these on your system: Command line git / Django 1.8 / Python 2.7.

2: Open a console and go to some directory where you will install the software.

3: Run the command

		git clone https://github.com/maximinus/grateful-dead-songs.git

4: The database password that the server uses is not in the server. We'll use sqlite.
   Open a test file and enter this:
   
	SECRET_KEY = 'hf5a&s%vdx_vt9af!3(nwo0v!$07wvj8w7g^a+px5t31rxczjl'
	DATABASES = {
		'default': {
			'ENGINE': 'django.db.backends.sqlite3',
			'NAME': 'db.sqlite3',
			'USER': '',
			'PASSWORD': '',
			'HOST': 'localhost',
			'PORT': '',
		}
	}

   Save this as grateful-dead-songs/gdsongs/gdsongs/private.py

5: Change your folder so you are now in grateful-dead-songs/gdsongs/

6: Enter the the commands in the same sequence:

	./manage.py makemigrations
	./manage.py migrate
	./manage.py createsuperuser
	
  You will be asked to enter a username and password.

7: Run the command

	./serve

   You should see 'Starting development server at http://127.0.0.1:8000/'

8: Open a web browser and go to 'http://127.0.0.1:8000'
   The admin section is found at 'http://127.0.0.1:8000/admin/'


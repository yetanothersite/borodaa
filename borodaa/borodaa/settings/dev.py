"""
borodaa project
development settings

Vlad Stepanov
"""

from borodaa.settings import secret
from borodaa.settings.base import *


DEBUG = True

ALLOWED_HOSTS = ['*', ]

SECRET_KEY = secret.get_secret_key()

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'borodaa',
        'USER': 'borodaa',
        'PASSWORD': '12345678',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

STATIC_ROOT = 'staticfiles'
STATIC_URL = '/static/'

MEDIA_ROOT = 'mediafiles'
MEDIA_URL = '/media/'

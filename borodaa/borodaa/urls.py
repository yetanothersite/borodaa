"""borodaa URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin

import os

from borodaa.settings.base import ADMIN_SITE_HEADER


admin.site.site_header = ADMIN_SITE_HEADER


urlpatterns = [
    url(r'^', include('yet_another_site.urls')),
    url(r'^admin/', admin.site.urls),
]

if os.environ['DJANGO_SETTINGS_MODULE'] == 'borodaa.settings.dev':
    from django.conf.urls.static import static
    from borodaa.settings.dev import (
        MEDIA_ROOT, MEDIA_URL, STATIC_ROOT, STATIC_URL
    )

    urlpatterns += static(STATIC_URL, document_root=STATIC_ROOT)
    urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)

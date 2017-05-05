"""
Vlad Stepanov
"""

from django.apps import AppConfig


class YetAnotherSiteConfig(AppConfig):
    name = 'yet_another_site'
    verbose_name = 'Yet Another Site'

    def ready(self):
        import yet_another_site.signals

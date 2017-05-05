"""
Vlad Stepanov
"""

from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.mail import EmailMessage

from borodaa.settings.base import MANAGERS as managers
from .models import Lead


@receiver(post_save, sender=Lead)
def lead_handler(sender, **kwargs):
    """
    On a real project, this should be asynchronous
    """
    instance = kwargs['instance']
    subject = 'Hello from Another Site'
    body = 'Message text from {}: {}'.format(instance.email, instance.message)
    bcc = [x[1] for x in managers]
    email = EmailMessage(subject, body, to=[instance.email, ], bcc=bcc)
    email.send()

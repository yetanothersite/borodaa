"""
Vlad Stepanov
"""

from django.forms import ModelForm

from .models import Lead


class LeadForm(ModelForm):
    class Meta:
        model = Lead
        fields = ['email', 'message', ]

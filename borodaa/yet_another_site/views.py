"""
Vlad Stepanov
"""

from django.views.generic import ListView, CreateView, DetailView, TemplateView
from django.http import JsonResponse

from .models import Nomenclature, Lead
from .forms import LeadForm


class Index(TemplateView):
    """ Main Page View """
    template_name = "yet_another_site/index.html"

    def get_context_data(self, **kwargs):
        object_list = Nomenclature.objects.filter(
                is_tested=True).prefetch_related('picture_set')[:3]
        return {"object_list": object_list}


class NomenclatureList(ListView):
    """ Nomenclature List View """
    model = Nomenclature

    def get_queryset(self):
        return super().get_queryset().filter(is_tested=True)


class NomenclatureDetail(DetailView):
    """ Nomenclature Detail View """
    model = Nomenclature


class AjaxableResponseMixin(object):
    """ AJAX support to a form """
    def form_invalid(self, form):
        response = super(AjaxableResponseMixin, self).form_invalid(form)
        if self.request.is_ajax():
            return JsonResponse(form.errors, status=400)
        else:
            return response

    def form_valid(self, form):
        if self.request.is_ajax():
            obj = form.save()
            data = {'id': obj.id, }
            return JsonResponse(data)
        else:
            response = super(AjaxableResponseMixin, self).form_valid(form)
            return response


class LeadCreate(AjaxableResponseMixin, CreateView):
    """ Lead Create View """
    model = Lead
    form = LeadForm
    fields = ('email', 'message', )

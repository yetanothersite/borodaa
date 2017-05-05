"""
Vlad Stepanov
"""

from django.conf.urls import url

from .views import Index, LeadCreate, NomenclatureList, NomenclatureDetail


urlpatterns = [
    url(r'^$', Index.as_view(),
        name='index'),
    url(r'^contacts/$', LeadCreate.as_view(),
        name='contacts'),
    url(r'^lead/create/$', LeadCreate.as_view(),
        name='create_lead'),
    url(r'^nomenclature/list/$', NomenclatureList.as_view(),
        name='nomenclature_list'),
    url(r'^nomenclature/(?P<pk>\d+)/detail/$', NomenclatureDetail.as_view(),
        name='nomenclature_detail'),
]

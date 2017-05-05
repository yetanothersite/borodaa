"""
Vlad Stepanov
"""

from django.contrib import admin
from django.contrib.admin.decorators import register

from . import models


@register(models.Lead)
class LeadAdmin(admin.ModelAdmin):
    list_display = ('pk', 'email', 'message', )
    list_display_links = ('email', )
    ordering = ('pk', 'email', )
    search_fields = ('email', )


class PictureInlineAdmin(admin.TabularInline):
    model = models.Picture
    extra = 1


@register(models.Nomenclature)
class NomenclatureAdmin(admin.ModelAdmin):
    list_display = ('pk', 'descr', 'sku', 'category', 'is_tested', )
    list_display_links = ('descr', )
    ordering = ('pk', 'descr', 'sku', 'category', 'is_tested', )
    search_fields = ('descr', )
    list_select_related = ('cover', )
    list_filter = ('category', 'is_tested', )
    inlines = (PictureInlineAdmin, )

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            self.master_id = obj.id
        return super().get_form(request, obj, **kwargs)

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'cover':
            qs = self.model.objects.get(id=self.master_id).picture_set.all()
            kwargs['queryset'] = qs
        return super().formfield_for_choice_field(db_field, request, **kwargs)

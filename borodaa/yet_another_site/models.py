"""
Vlad Stepanov
"""

from django.db import models
from django.utils.translation import ugettext as _


class Lead(models.Model):
    """ Lead """
    email = models.EmailField(_("e-mail"))
    message = models.TextField(_("message"))

    def __str__(self):
        return "{} {}".format(self.pk, self.email)

    class Meta:
        verbose_name = _("lead")
        verbose_name_plural = _("leads")


CATEGORY_CHOICES = (
    ("A", _("Category") + " A"),
    ("B", _("Category") + " B"),
    ("C", _("Category") + " C"),
)


class Nomenclature(models.Model):
    """ Nomenclature """
    descr = models.CharField(_("decription"), max_length=255)
    is_tested = models.BooleanField(_("is tested"), default=True)
    category = models.CharField(_("category"), max_length=1,
                                choices=CATEGORY_CHOICES)
    sku = models.PositiveIntegerField(_("SKU"), blank=True, null=True)
    cover = models.OneToOneField(
        'Picture',
        related_name='cover_for',
        verbose_name=_("cover"),
        null=True, blank=True,
        on_delete=models.PROTECT
    )

    def __str__(self):
        return "{} {}".format(self.pk, self.descr)

    class Meta:
        verbose_name = _("nomenclature")
        verbose_name_plural = _("nomenclature")


def picture_directory_path(instance, filename):
    return "nomenclature/{0}/{1}".format(instance.nomenclature.id, filename)


class Picture(models.Model):
    """ Pictures for Nomenclature """
    nomenclature = models.ForeignKey(
        Nomenclature,
        verbose_name=_("nomenclature"),
        on_delete=models.CASCADE
    )
    descr = models.CharField(_("decription"), max_length=255)
    image = models.ImageField(
        _("image"), upload_to=picture_directory_path)

    def __str__(self):
        return "{} {}".format(self.pk, self.descr)

    class Meta:
        verbose_name = _("picture")
        verbose_name_plural = _("pictures")

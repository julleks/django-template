from apps.accounts.models import User
from django.contrib import admin

__all__ = ["UserAdmin"]


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ("id", "username", "email", "first_name", "last_name")

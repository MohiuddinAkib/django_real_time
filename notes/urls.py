from . import views
from django.urls import path


urlpatterns = [
    path('', views.NoteList.as_view()),
    path('<int:pk>', views.NoteDetail.as_view())
]

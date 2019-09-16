FROM python:3.6-slim

LABEL maintainer="md akib"

ARG PORT
ARG DJANGO_SECRET_KEY
ARG DB_DRIVER
ARG DB_HOST
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DB_PORT

ENV PORT=${PORT}
ENV DJANGO_SECRET_KEY==${DJANGO_SECRET_KEY}
ENV DB_DRIVER=${DB_DRIVER}
ENV DB_HOST=${DB_HOST}
ENV DB_USER=${DB_USER}
ENV DB_PASS=${DB_PASS}
ENV DB_NAME=${DB_NAME}
ENV DB_PORT=${DB_PORT}
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && pip install --no-cache-dir -r  requirements.txt \
    && apt-get autoremove -y gcc

COPY . ./

EXPOSE ${PORT}

ENTRYPOINT [ "python", "manage.py", "runserver" ]

CMD [ "0.0.0.0:${PORT}" ]


FROM python:3.9-alpine

COPY ./requirements.txt /
RUN pip3 install -r /requirements.txt

COPY ./src /app
COPY ./wsgi/gunicorn.sh /app/

WORKDIR /app



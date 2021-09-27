# base image
FROM python:3.9.7-buster
 
# options
ENV PYTHONUNBUFFERED 1
 
# Set working directory
RUN mkdir /app
# set working directory
WORKDIR /app
# coppy commands 
COPY . /app
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y netcat-openbsd gcc && \
    apt-get clean

RUN pip install --upgrade pip
RUN pip install psycopg2-binary
RUN pip install -r requirements.txt
# collectstatic command
# RUN python manage.py collectstatic --no-input
# migrations command
# RUN python manage.py makemigrations
# RUN python manage.py migrate
# Expose port out of continer 
EXPOSE 5000
CMD ["gunicorn","--bind", ":5000", "core.wsgi:application"]

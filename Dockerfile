FROM python:3.9.7-buster

ENV PYTHONUNBUFFERED 1

# Set working directory
RUN mkdir /app
WORKDIR /app
COPY . /app

# Installing requirements
ADD requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Collect static files
# RUN python manage.py collectstatic --no-input

CMD ["gunicorn","--bind", ":5000", "core.wsgi:application"]

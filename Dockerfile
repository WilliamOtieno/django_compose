FROM python:3.9-slim

WORKDIR /usr/src/app

COPY . .

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG False
ENV PORT 8000
EXPOSE $PORT

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

CMD echo $PORT && python manage.py runserver 0.0.0.0:$PORT

FROM python:3.12

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY ./django .

CMD sh -c "python manage.py migrate && python manage.py collectstatic --no-input && uwsgi --ini uwsgi.ini"
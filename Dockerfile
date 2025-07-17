FROM python:3.10

WORKDIR /data

# Install distutils and pip
RUN apt-get update && \
    apt-get install -y python3-distutils && \
    apt-get install -y python3-pip && \
    apt-get clean

# Install Django
RUN python -m pip install --upgrade pip && \
    pip install django==3.2

COPY . .

# Migrate DB
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

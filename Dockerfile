# Selección de la imagen Docker
FROM python:3.7-alpine
# Nombre del programador que mantiene el código
MAINTAINER Eduardo Agreda

# Se plantea que no tenga buffer Python para evitar problemas con Docker
ENV PYTHONUNBUFFERED 1

# Se copian los requerimientos y se ejecutan con pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Creación de directorio para guardar el código
RUN mkdir /app
# Selecciona la carpeta app como directorio principal
WORKDIR /app 
# Copia los datos de la carpeta ./app al directorio principal
COPY ./app /app

RUN adduser -D eagreda
USER eagreda

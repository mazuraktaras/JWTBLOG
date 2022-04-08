FROM python:3.7-slim

LABEL Author="Taras Mazurak"
LABEL E-mail="xperia.t.mazurak@gmail.com"
LABEL version="0.0.1b"

ENV PYTHONDONTWRITEBYTECODE 1
ENV FLASK_APP "blog.py"
ENV FLASK_ENV "development"
ENV FLASK_DEBUG True
ENV APP_PORT 5000
# ENV C_FORCE_ROOT true

RUN mkdir /jwtblog
WORKDIR /jwtblog

RUN pip install --upgrade pip

COPY ./requirements.txt /jwtblog/requirements.txt
RUN pip install -r requirements.txt

ADD . /jwtblog

EXPOSE $APP_PORT

CMD flask run --host=0.0.0.0 --port=$APP_PORT

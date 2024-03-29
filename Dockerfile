FROM python:3.7

LABEL Author="Taras Mazurak"
LABEL E-mail="xperia.t.mazurak@gmail.com"
LABEL version="0.0.1b"

ENV PYTHONDONTWRITEBYTECODE 1
ENV FLASK_APP "blog.py"
# ENV FLASK_ENV "development"
ENV FLASK_DEBUG False
# ENV C_FORCE_ROOT true

RUN mkdir /jwtblog
WORKDIR /jwtblog

RUN pip install --upgrade pip

COPY ./requirements.txt /jwtblog/requirements.txt
RUN pip install -r requirements.txt

ADD . /jwtblog

EXPOSE 5000
CMD flask run --host=0.0.0.0

FROM python:3.8-alpine

STOPSIGNAL SIGQUIT

WORKDIR /app

RUN apk --no-cache add musl-dev g++ linux-headers libstdc++

COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
RUN apk del musl-dev g++ linux-headers

ADD . /app

CMD python3 main.py

FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip &&\
    apt-get install -y python3-setuptools python3-dev build-essential python3-mysqldb 

RUN pip3 install flask && \
    pip install flask-mysql && \
    pip3 install mysql-connector-python && \
    pip3 install cryptography && \
    pip3 install flask_mysqldb

WORKDIR /app


ENTRYPOINT [ "python3" ]

CMD ["app.py"]





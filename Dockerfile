FROM debian:wheezy
RUN apt-get update -qq && apt-get install -qy python python-pip python-dev git && apt-get clean
WORKDIR /code/

ADD requirements.txt /code/
RUN pip install -r requirements.txt

ADD requirements-dev.txt /code/
RUN pip install -r requirements-dev.txt

ADD . /code/
RUN python setup.py install

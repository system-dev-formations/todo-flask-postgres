FROM ubuntu

RUN apt-get update
RUN apt-get -y install python3 python3-pip vim iputils-ping

ADD templates /opt/templates
ADD static    /opt/static
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY todo.py /opt
COPY todo.cfg /opt

ENTRYPOINT FLASK_APP=/opt/todo.py flask run --host=0.0.0.0


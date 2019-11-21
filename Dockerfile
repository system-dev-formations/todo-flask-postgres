FROM ubuntu

RUN apt-get update
RUN apt-get -y install python python-pip vim iputils-ping 

ADD templates /opt/templates
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY todo.py /opt
COPY todo.cfg /opt

ENTRYPOINT FLASK_APP=/opt/todo.py flask run --host=0.0.0.0


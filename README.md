# Todo-flask-postgresql
Example on how to set up a multi-containers platform using Python-Flask-SqlAlchemy, postgresql12 database 
and Pgadmin4

Get this repository  
```git clone https://github.com/system-dev-formations/todo-flask-postgres.git```  
Do a fork and git clone in your system or in your Vm

## How to set up the environment platform
Start a Postgresql database container   
```shell script
docker run -d -it --name db -e POSTGRES_PASSWORD=password  -v /opt/postgres:/var/lib/postgresql/data \
  -p 6432:5432  systemdevformations/postgresql-alpine
```
Launch a PgAdmin 4 container connected to the Postgresql database
```shell script
docker run -d --name pgadmin -p 20100:80 --link db:postgres -e PGADMIN_DEFAULT_EMAIL=ambient-it@gmail.com \
-e PGADMIN_DEFAULT_PASSWORD=p4ssw0rd dpage/pgadmin4
```
Study the way how to set up the database connection using the Docker internal DNS container name 
as an IP address entry. 

In pgAdmin4  set a connection to the postgresql database, username is ambient-it@gmail.com and the password is
p4ssw0rd   
create a database named ```tododb```      
and run the script ```./sql/todos.sql```  against the ```tododb``` database

  
Build todo-sql image  
```cd todo-flask-postgres```  
```docker build -t todo-postgres . ```  
  
After type in your shell console  
```code 
docker run -it -d --name todo --link db:todo -p 5000:5000 todo-postgres
```

# Test
Bring up your favorite browser   
``` http://localhost:5000/```
and check te connectivity

# Docker-compose version 
We are going to setup a python virtualenv 
## On ubuntu
### Packages, virtualenv, activate  
```code
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install python3-venv
python3 -m venv venv
source venv/bin/activate
```
### docker-compose set up
```code 
pip3 install wheel
pip3 install docker-compose
```
## On Centos
```code 
sudo yum install python3
sudo yum install python3-pip
python3 -m venv venv
source venv/bin/activate
pip3 install docker-compose
pip3 install --upgrade pip
```
## Execute
In the directory todo-flask-mysql, hit   
```docker-compose up ```  
or  
```docker-compose up -d```
# Todo-flask-postgresql
Example on how to set up a multi-containers platform using Python-Flask and postgres database 

## How to set up the environment platform
Start a Postgresql database container   
```code
docker run -d -it --name db -e POSTGRES_PASSWORD=password  -p 6432:5432 \
 systemdevformations/postgresql-alpine
```
Launch a PgAdmin 4 container connected to the Postgresql database
```code
docker run -d --name pgadmin -p 20100:80 -e PGADMIN_DEFAULT_EMAIL=ambient-it@gmail.com \
-e PGADMIN_DEFAULT_PASSWORD=p4ssw0rd dpage/pgadmin4
```
Get this repository  
```git clone https://github.com/system-dev-formations/todo-flask-postgres.git```  
Build todo-sql image  
```cd todo-flask-postgres```  
```docker build -t todo-sql . ```  
In your Goland Intellij IDE set a connection to the MySQL database   
create a database named ```tododb```      
and run the script ./sql/todos.sql   
After type in your shell console  
```code 
docker run -it --name todo --link db:todo -p 5000:5000 todo-sql
```

# Test
Bring up your favorite browser   
``` http://localhost:5000/```
and check 

# Docker-compose version 
We are going to setup a python virtualenv 
## On ubuntu
### Packages, virtualenv, activate  
```code
apt-get install python3
apt-get install python3-pip
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
sudo yum install pythonn3
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



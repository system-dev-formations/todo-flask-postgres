# Todo-flask-postgres
Example on how to set up a multi-containers platform using Python-Flask-SqlAlchemy, postgresql12 database 
and Pgadmin4

Get this repository  
```git clone https://github.com/system-dev-formations/todo-flask-postgres.git```  
Do a fork and git clone in your local host where your IDE is installed and in your Vm

## How to set up the environment platform
Start the Postgresql database container   
```shell script
docker run -d --name db -e POSTGRES_PASSWORD=password  -v /opt/postgres:/var/lib/postgresql/data \
  -p 6432:5432  systemdevformations/docker-postgres12
```
Launch the PgAdmin 4 container connected to the Postgresql database
```shell script
docker run -d --name pgadmin -p 20100:80 --link db:postgres -e PGADMIN_DEFAULT_EMAIL=ambient-it@gmail.com \
-e PGADMIN_DEFAULT_PASSWORD=p4ssw0rd dpage/pgadmin4
```
Study the way how to set up the database connection using the Docker internal DNS container name 
as an IP address entry. So for connecting to postgresql database use the container name db and its port number 5432.

## Different ways for installing the tododb database

### Using the command line interface (CLI)
```shell
cd todo-flask-postgres
cd sql
docker cp todo.sql db:/tmp
docker exec -it db /bin/ash
cd tmp
ls 
su postgres
create database tododb;
\c tododb
\i todos.sql
select * from todos;
\q 
exit
```

### Using Jetbrains
Click on the tab named Database on the right hand-side of your Jetbrains IDE    
click on the sign + and select datasource -> PostgreSQL  
enter a name, ip address, username postgres , password: password     
Hit test connection button  
After that a console screen is opened  
Type ```CREATE DATABASE tododb;```  
Edit the file ```todos.sql``` in your project file the sql directory   
Put your mouse cursor in the file and right click , select run todos
Press the sign + on target datasource and select tododb    
and press run   


### Using pgadmin4
In pgAdmin4  set a connection to the postgresql database, username is ambient-it@gmail.com and the password is
p4ssw0rd   
create a database named ``` create database tododb```      
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
and check the connectivity

# Docker-compose version 
We are going to setup a python virtualenv 
## On ubuntu
### Packages, virtualenv, activate  
```code
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install python3-venv
sudo apt-get -y install build-essential
sudo apt-get install python3-dev libxml2-dev libxslt-dev libffi-dev
python3 -m venv venv
source venv/bin/activate
```
### docker-compose setup
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

```
## Execute
In the directory todo-flask-mysql, type   
```docker-compose up ```   for frontend usage
or  
```docker-compose up -d```   for background usage


#- NOTE pour Ubuntu 16.04 ----
```shell
rm -Rf venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade "pip < 21.0"
pip install wheel
pip install docker
pip install docker-compose
pip3 install ansible

```
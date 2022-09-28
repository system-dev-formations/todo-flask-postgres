# Liquibase Tutorial





##  Create a sample database
### Git clone just one file
```shell
git clone --no-checkout  https://github.com/system-dev-formations/todo-flask-postgres.git # clone all project
cd todo-flask-postgres/  # change to the working directory 
git reset # set all files as candidate to be deleted: beware it's critical
git checkout origin/master create-database.yml  # checkout only  one file
rm -Rf .git  # to prevent any wrong doing afterward
```



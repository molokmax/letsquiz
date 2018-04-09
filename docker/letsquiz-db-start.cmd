xcopy /y ..\database\init.sql .
xcopy /y ..\database\letsquiz.sql .
docker build -t letsquiz-db-image -f Dockerfile-db .
docker run -d -p 33060:3306 -e MYSQL_ROOT_PASSWORD=root --name letsquiz-db letsquiz-db-image

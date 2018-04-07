xcopy /y ..\php.ini .
docker build -t letsquiz-app-image -f Dockerfile-app .
docker run -d -p 8088:80 -v D:/develop/letsquiz/build:/var/www/html/ --name letsquiz-app --link letsquiz-db letsquiz-app-image

# mall

`
docker build -t centos-nginx . && docker rm -f centos-nginx-1 && docker run -it --name centos-nginx-1 -p 8801:80 -d centos-nginx
`


docker build -t centos-mysql . && docker rm -f centos-mysql-1 && docker run -it --name centos-mysql-1 -d centos-mysql

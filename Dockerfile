FROM centos:7
RUN yum install -y wget
RUN yum install -y gcc-c++
RUN yum install -y pcre pcre-devel
RUN yum install -y zlib zlib-devel
RUN yum install -y openssl openssl-devel
RUN yum install -y libxml2 libxml2-devel

WORKDIR /usr/local/src
RUN wget http://nginx.org/download/nginx-1.16.1.tar.gz
RUN tar -zxvf nginx-1.16.1.tar.gz
WORKDIR nginx-1.16.1
RUN ./configure
RUN make
RUN make install
COPY ./www/ /usr/local/nginx/html/
COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf

WORKDIR /usr/local/src
RUN wget https://www.php.net/distributions/php-5.6.40.tar.gz
RUN tar -zxvf php-5.6.40.tar.gz
WORKDIR php-5.6.40
RUN ./configure --enable-fpm --with-mysql
RUN make
RUN make install

EXPOSE 80

COPY ./sh/ /opt/sh/

ENTRYPOINT ["/opt/sh/startup.sh"]
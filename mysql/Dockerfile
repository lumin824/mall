FROM centos:7
RUN curl -OL https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
RUN rpm -ivh mysql57-community-release-el7-9.noarch.rpm
RUN yum install mysql-server
RUN systemctl start mysqld
RUN systemctl enable mysqld

# EXPOSE 3306

COPY ./entrypoint.sh .

ENTRYPOINT ["entrypoint.sh"]

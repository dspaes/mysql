FROM alpine:edge

EXPOSE 3306

RUN apk add --no-cache mysql mysql-client
ENV MYSQL_ROOT_USER=root \
    MYSQL_ROOT_PASSWORD=toor \ 
    datadir=/var/lib/mysql

RUN mkdir /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

USER mysql

ENTRYPOINT [ "mysqld", "--datadir=/var/lib/mysql" ]
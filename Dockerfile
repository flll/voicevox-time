FROM busybox:1.36.0-uclibc

EXPOSE 8080

COPY index.html /var/www/index.html
COPY resource /var/www/resource

CMD httpd -f -p 8080 -h /var/www

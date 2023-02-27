FROM busybox:1.36.0-uclibc

EXPOSE 8080

COPY --chown=nobody:nogroup index.html /var/www/index.html
COPY --chown=nobody:nogroup resource /var/www/resource

RUN chmod -R a-w /var/www

USER nobody
CMD exec httpd -f -p 8080 -h /var/www

STOPSIGNAL 9
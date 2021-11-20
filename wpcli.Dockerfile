FROM wordpress:cli

COPY init-wp.sh /usr/local/bin/

ENTRYPOINT ["init-wp.sh"]


FROM docker:25-git

COPY builder.sh /usr/local/bin/builder.sh
RUN chmod +x /usr/local/bin/builder.sh

ENTRYPOINT ["/usr/local/bin/builder.sh"]

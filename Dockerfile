FROM shimaore/debian
MAINTAINER Stéphane Alnet <stephane@shimaore.net>

# Install prereqs
RUN apt-get update && apt-get --no-install-recommends -y install \
  redis-server
RUN sed -i -e 's/daemonize yes/daemonize no/' /etc/redis/redis.conf

# Finalize
USER redis
EXPOSE 6379
CMD ["/usr/bin/redis-server","/etc/redis/redis.conf"]

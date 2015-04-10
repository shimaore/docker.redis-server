FROM shimaore/debian
MAINTAINER Stéphane Alnet <stephane@shimaore.net>

# Install prereqs
RUN apt-get update && apt-get --no-install-recommends -y install \
  redis-server
COPY start.sh /usr/sbin/start-redis.sh

# Finalize
USER redis
EXPOSE 6379
CMD ["/usr/sbin/start-redis.sh"]

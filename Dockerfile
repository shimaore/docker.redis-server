FROM shimaore/debian
MAINTAINER Stéphane Alnet <stephane@shimaore.net>

# Install prereqs
RUN apt-get update && apt-get --no-install-recommends -y install \
  redis-server

# Finalize
USER redis
EXPOSE 6379
CMD ["/usr/bin/redis-server","127.0.0.1:6379"]

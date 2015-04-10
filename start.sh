#!/bin/bash
/bin/sed -i -e 's/daemonize yes/daemonize no/' /etc/redis/redis.conf
if [ -n "${REDIS_BIND}" ]; then
  /bin/sed -i -e "s/^bind .*$/bind ${REDIS_BIND}/"
fi

exec /usr/bin/redis-server /etc/redis/redis.conf

#!/bin/bash
CONF=/var/lib/redis/redis.conf
cp /etc/redis/redis.conf $CONF
/bin/sed -i -e 's/daemonize yes/daemonize no/' $CONF
if [ -n "${REDIS_BIND}" ]; then
  /bin/sed -i -e "s/^bind .*$/bind ${REDIS_BIND}/" $CONF
fi

exec /usr/bin/redis-server $CONF

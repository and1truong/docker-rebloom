FROM redislabs/rebloom:2.0.3 as rebloom
FROM redis:5.0-alpine as redis
FROM alpine:3.9

RUN set -ex
COPY --from=rebloom /usr/lib/redis/modules/redisbloom.so /redisbloom.so
COPY --from=redis /usr/local/bin/redis-server /redis-server
CMD ["/redis-server", "--loadmodule", "/redisbloom.so"]

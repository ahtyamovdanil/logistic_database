FROM yandex/clickhouse-server
ADD ./init_queries /docker-entrypoint-initdb.d/
ADD ./users.xml /etc/clickhouse-server/users.xml
ADD ./listen.xml /etc/clickhouse-server/config.d/listen.xml

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    tdsodbc \
    freetds-bin \
    sqsh
FROM ubuntu:24.04

ENV ARCH=amd64
ENV VERSION=1.1.3
RUN apt-get update &&\
    apt-get -y install curl unzip &&\
    curl -LO https://github.com/duckdb/duckdb/releases/download/v$VERSION/duckdb_cli-linux-$ARCH.zip &&\
    unzip duckdb_cli-linux-$ARCH -d /usr/local/bin/ &&\
    rm duckdb_cli-linux-$ARCH.zip &&\
    apt-get -y remove curl unzip &&\
    apt-get -y autoremove &&\
    rm -rf /var/lib/apt/lists/* &&\
    duckdb ro.db "INSTALL httpserver FROM community;"
ENV DUCKDB_HTTPSERVER_FOREGROUND=1
CMD ["duckdb", "--readonly", "ro.db", "LOAD httpserver", "SELECT httpserve_start('0.0.0.0', 9999, '');"]

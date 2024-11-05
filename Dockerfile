FROM ubuntu:24.04

RUN apt-get update &&\
    apt-get -y install curl unzip &&\
    curl -LO https://github.com/duckdb/duckdb/releases/download/v1.1.2/duckdb_cli-linux-aarch64.zip &&\
    unzip duckdb_cli-linux-aarch64 -d /usr/local/bin/ &&\
    rm duckdb_cli-linux-aarch64.zip &&\
    apt-get -y remove curl unzip &&\
    apt-get -y autoremove &&\
    rm -rf /var/lib/apt/lists/* &&\
    duckdb ro.db "INSTALL httpserver FROM community;"
ENV DUCKDB_HTTPSERVER_FOREGROUND=1
CMD ["duckdb", "--readonly", "ro.db", "LOAD httpserver", "SELECT httpserve_start('0.0.0.0', 9999, '');"]

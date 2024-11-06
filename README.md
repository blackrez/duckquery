# Duckquery - use duckdb as serverless database

#Duckdb easy to use like BigQuery, it's possible with docker and the http_server extension (thanks to Lorenzo Mangani).

## Goals 

Deploy and use duckdb on cloud providers easy as bigquery.

## Internals

It use the great extension http_server. It loads a duckdb instance on memory, so for now, everything is stateless.

## Deploy on GCP Cloud Run

Use this this simple button

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)

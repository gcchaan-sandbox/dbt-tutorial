### このリポジトリについて

dbtのチュートリアル[Quickstart for dbt Core from a manual install](https://docs.getdbt.com/quickstarts/manual-install)・[Quickstart for dbt Cloud and Redshift](https://docs.getdbt.com/quickstarts/redshift)をベースにPostgreSQLで実行できるようにして試したものです。

### Required

- Python3
- Docker

### Get started

1. python -m venv venv
1. source venv/bin/activate
1. pip install dbt-postgresql
1. docker compose up -d
1. vi ~/.dbt/profile.yml
    - 設定内容は `profile.yml.example` 参照
1. cd jaffle_shop
1. dbt debug
1. dbt test
1. dbt run
1. dbt docs generate
1. dbt docs serve

### Operation command

```
docker compose exec -it postgres bash
```

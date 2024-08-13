# DB meetup

## Start postgres

```shell
docker run -d --rm --name postgres_db_meetup -p 5434:5432 -v $PWD/init.sql:/docker-entrypoint-initdb.d/init.sql -e POSTGRES_PASSWORD=1 -e POSTGRES_USER=app -e POSTGRES_DB=app_database postgres:16
```

## Connect to postgres

```shell
docker exec -it postgres_db_meetup psql -U app app_database
```


## Stop postgres

```shell
docker stop postgres_db_meetup
```

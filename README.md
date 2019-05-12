# RabbitMQ2DB

## Getting Started

Setup the supported services, for example:

```
docker run -d --rm -p 5672:5672 rabbitmq:3.7
docker run -d --rm -p 5432:5432 postgres
```

Setup the database, for example:

```
mix ecto.create
mix ecto.migrate
```

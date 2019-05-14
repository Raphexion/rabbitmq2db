FROM elixir:alpine as builder

RUN apk --no-cache add --upgrade build-base bash git

ADD . /app
WORKDIR /app

ENV REPLACE_OS_VARS=true
ENV MIX_ENV=prod

RUN sh -c "mix do local.rebar --force, local.hex --force, deps.get --only ${MIX_ENV}, deps.compile, compile, release --env=prod"

FROM alpine:latest

ENV REPLACE_OS_VARS=true
ENV MIX_ENV=prod
ENV PORT=4000
ENV DATABASE_USERNAME="postgres"
ENV DATABASE_PASSWORD="postgres"
ENV DATABASE_NAME="rabbitmq2db"
ENV DATABASE_HOST="127.0.0.1"

RUN apk --no-cache add --upgrade bash openssl-dev unzip

COPY --from=builder /app/_build/prod/rel/rabbitmq2db /app

WORKDIR /app
ENTRYPOINT ["bin/rabbitmq2db"]
CMD ["foreground"]

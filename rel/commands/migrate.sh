#!/bin/sh

release_ctl eval --mfa "RabbitMQ2DB.ReleaseTasks.migrate/1" --argv -- "$@"

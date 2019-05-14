#!/bin/sh

release_ctl eval --mfa "RabbitMQ2DB.ReleaseTasks.seed/1" --argv -- "$@"

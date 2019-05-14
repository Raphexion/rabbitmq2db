use Mix.Config

# Use UTC time in logs
config :logger, utc_log: true

# Output iso8601-ish timestamp in console log
config :logger, :console,
  format: "$dateT$timeZ $metadata[$level] $message\n",
  metadata: [:request_id]

config :rabbitmq2db, Rabbitmq2db.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "${DATABASE_USERNAME}",
  password: "${DATABASE_PASSWORD}",
  database: "${DATABASE_NAME}",
  hostname: "${DATABASE_HOST}"

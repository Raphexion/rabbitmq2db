# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rabbitmq2db,
  namespace: RabbitMQ2DB,
  ecto_repos: [RabbitMQ2DB.Repo]

# Configures the endpoint
config :rabbitmq2db, RabbitMQ2DBWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x+TclA9XK6apOewqlAF9t463aGQlZfDyAhOjJwPggBIR3SyKZWCdKm9qAEnROJ8z",
  render_errors: [view: RabbitMQ2DBWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RabbitMQ2DB.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

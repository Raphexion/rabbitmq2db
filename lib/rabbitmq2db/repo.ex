defmodule RabbitMQ2DB.Repo do
  use Ecto.Repo,
    otp_app: :rabbitmq2db,
    adapter: Ecto.Adapters.Postgres
end

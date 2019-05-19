defmodule RabbitMQ2DB.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {RabbitMQ2DB.DataReceiver, []},
      {RabbitMQ2DB.InfoReceiver, []},

      # Start the Ecto repository
      RabbitMQ2DB.Repo,
      # Start the endpoint when the application starts
      RabbitMQ2DBWeb.Endpoint
      # Starts a worker by calling: RabbitMQ2DB.Worker.start_link(arg)
      # {RabbitMQ2DB.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RabbitMQ2DB.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RabbitMQ2DBWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

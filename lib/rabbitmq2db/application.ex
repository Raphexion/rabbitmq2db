defmodule RabbitMQ2DB.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {RabbitMQ2DB.Repo, []},
      {RabbitMQ2DB.DataReceiver, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RabbitMQ2DB.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

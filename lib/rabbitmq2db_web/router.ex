defmodule RabbitMQ2DBWeb.Router do
  use RabbitMQ2DBWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RabbitMQ2DBWeb do
    pipe_through :api
  end
end

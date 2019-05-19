defmodule RabbitMQ2DBWeb.Router do
  use RabbitMQ2DBWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: RabbitMQ2DBWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: RabbitMQ2DBWeb.Schema,
      interface: :simple
  end
end

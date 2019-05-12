defmodule RabbitMQ2DB.File do
  use Ecto.Schema

  schema "files" do
    field :data, :binary
    field :hash, :string
    timestamps()
  end
end

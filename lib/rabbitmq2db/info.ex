defmodule RabbitMQ2DB.Info do
  use Ecto.Schema

  schema "infos" do
    field :username, :string
    field :filename, :string
    field :path, :string
    field :hash, :string
    timestamps()
  end

  def changeset(info, params \\ %{}) do
    info
    |> Ecto.Changeset.cast(params, [:username, :filename, :path, :hash])
    |> Ecto.Changeset.validate_required([:username, :filename, :path, :hash])
  end
end

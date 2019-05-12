defmodule RabbitMQ2DB.File do
  use Ecto.Schema

  schema "files" do
    field :data, :binary
    field :hash, :string
    timestamps()
  end

  def changeset(file, params \\ %{}) do
    file
    |> Ecto.Changeset.cast(params, [:data, :hash])
    |> Ecto.Changeset.validate_required([:data, :hash])
  end
end

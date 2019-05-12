defmodule RabbitMQ2DB.Repo.Migrations.Files do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :data, :bytea
      add :hash, :string
      timestamps()
    end
  end
end

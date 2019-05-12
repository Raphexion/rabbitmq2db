defmodule RabbitMQ2DB.Repo.Migrations.Infos do
  use Ecto.Migration

  def change do
    create table(:infos) do
      add :username, :string
      add :path, :string
      add :filename, :string
      add :hash, :string

      timestamps()
    end
  end
end

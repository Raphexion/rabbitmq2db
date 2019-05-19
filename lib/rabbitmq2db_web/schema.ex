defmodule RabbitMQ2DBWeb.Schema do
  use Absinthe.Schema

  alias RabbitMQ2DB.Repo
  alias RabbitMQ2DB.File
  alias RabbitMQ2DB.Info

  query do
    field :files, list_of(:file) do
      resolve fn _, _, _ ->
	{:ok, Repo.all(File)}
      end
    end

    field :infos, list_of(:info) do
      resolve fn _, _, _ ->
	{:ok, Repo.all(Info)}
      end
    end
  end

  object :file do
    field :data, :string  # base64 encoded
    field :hash, :string
  end

  object :info do
    field :username, :string
    field :filename, :string
    field :path, :string
    field :hash, :string
  end
end

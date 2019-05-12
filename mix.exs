defmodule RabbitMQ2DB.MixProject do
  use Mix.Project

  def project do
    [
      app: :rabbitmq2db,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RabbitMQ2DB.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:kiks, git: "git://github.com/Raphexion/kiks.git"},
      {:poison, "~> 4.0"}
    ]
  end
end

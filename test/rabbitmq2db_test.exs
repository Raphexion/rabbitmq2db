defmodule RabbitMQ2DBTest do
  use ExUnit.Case
  doctest RabbitMQ2DB

  test "greets the world" do
    assert RabbitMQ2DB.hello() == :world
  end
end

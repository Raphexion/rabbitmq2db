defmodule RabbitMQ2DB.DataReceiver do
  use GenServer

  alias RabbitMQ2DB.File
  alias RabbitMQ2DB.Repo

  @exchange      "ftpdata"
  @queue         "dataqueue"
  @all           "#"

  def start_link([]) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def proces(tag, pid, payload, routing_key) do
    GenServer.call(__MODULE__, {:process, tag, pid, payload, routing_key})
  end

  def count() do
    GenServer.call(__MODULE__, :count)
  end

  @impl true
  def init(nil) do
    :kiks_consumer_sup.add_child(@exchange, @queue, @all, :send, self())
    {:ok, 0}
  end

  @impl true
  def handle_call(:count, _from, count) do
    {:reply, {:ok, count}, count}
  end

  @impl true
  def handle_info({sender, _tag, _pid, payload, _routing_key}, state) do
    hash = payload |> :kiks_support.hash() |> to_string()

    %File{data: payload, hash: hash}
    |> File.changeset()
    |> Repo.insert()

    send(sender, {self(), :ok})

    {:noreply, state}
  end
end

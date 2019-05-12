defmodule RabbitMQ2DB.InfoReceiver do
  require Logger

  use GenServer
  alias __MODULE__

  alias RabbitMQ2DB.Info
  alias RabbitMQ2DB.Repo

  @exchange      "ftpinfo"
  @random_queue  ""
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
    :kiks_consumer_sup.add_child(@exchange, @random_queue, @all, :send, self())
    {:ok, 0}
  end

  @impl true
  def handle_call(:count, _from, count) do
    {:reply, {:ok, count}, count}
  end

  @impl true
  def handle_info({sender, tag, pid, payload, routing_key}, state) do
    data = Poison.decode!(payload) |> fix_strings()
    Logger.warn("got info #{inspect data}")

    %Info{}
    |> Info.changeset(data)
    |> Repo.insert()

    send(sender, {self(), :ok})

    {:noreply, state}
  end

  defp fix_strings(data) do
    Map.to_list(data)
    |> Enum.map(fn {key, value} -> {to_string(key), to_string(value)} end)
    |> Map.new()
  end
end

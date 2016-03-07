defmodule Scrivener.KeyValue do
  use Ecto.Model
  import Ecto.Query
  @primary_key {:key, :string, autogenerate: false}

  schema "key_values" do
    field :value, :string
  end

  def zero(__MODULE__) do
    __MODULE__ |> where([p], p.value == "0")
  end
  def zero(entries) do
    entries |> Enum.filter(&(&1.value == "0"))
  end

end

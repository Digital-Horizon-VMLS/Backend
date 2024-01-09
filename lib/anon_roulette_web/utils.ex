defmodule AnonRouletteWeb.Utils do
  @doc """
  Parse the given string id to integer
  """
  def parse_id(id) when is_bitstring(id) do
    case Integer.parse(id) do
      {integer, _} -> {:ok, integer}
      :error -> {:error, :invalid_id}
    end
  end

  def parse_id(id) when is_integer(id) do
    {:ok, id}
  end
end

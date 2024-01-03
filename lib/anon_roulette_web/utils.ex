defmodule AnonRouletteWeb.Utils do
  @doc """
  Parse the given string id to integer
  """
  def parse_id(id) when is_bitstring(id) do
    case Integer.parse(id) do
      {integer, _} -> {:ok, integer}
      :error -> {:error, :not_found}
    end
  end
end

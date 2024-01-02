defmodule AnonRouletteWeb.EthnicityJSON do
  @doc """
  Renders a list of ethnicities.
  """
  def index(%{ethnicities: ethnicities}) do
    for ethnicity <- ethnicities, do: data(ethnicity)
  end

  @doc """
  Renders a single ethnicity.
  """
  def show(%{ethnicity: ethnicity}) do
    data(ethnicity)
  end
  
  defp data(ethnicity) do
    %{
      id: ethnicity.ethnic_id,
      name: ethnicity.ethnic_name
    }
  end
end

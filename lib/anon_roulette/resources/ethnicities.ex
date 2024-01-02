defmodule AnonRoulette.Resources.Ethnicities do
  alias AnonRoulette.Ethnicity
  alias AnonRoulette.Repo

  @doc """
  Get a list of all ethnicities
  """
  def all_ethnicities do
    Repo.all(Ethnicity)
  end

  @doc """
  Get ethnicity using id
  """
  def get_ethnicity(id) do
    case Repo.get(Ethnicity, id) do
      nil -> {:error, :not_found}
      ethnicity -> {:ok, ethnicity}
    end
  end
end
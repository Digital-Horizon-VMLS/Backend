defmodule AnonRoulette.Resources.Categories do
  alias AnonRoulette.Category
  alias AnonRoulette.Repo

  @doc """
  Get a list of all items within category
  """
  def all_category do
    Repo.all(Category)
  end

  @doc """
  Get category using id
  """
  def get_category(id) do
    case Repo.get(Category, id) do
      nil -> {:error, :not_found}
      category = %{} -> {:ok, category}
    end
  end
end

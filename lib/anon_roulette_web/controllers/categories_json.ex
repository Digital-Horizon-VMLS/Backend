defmodule AnonRouletteWeb.CategoriesJSON do
  @doc """
  Renders a list of categories.
  """
  def index(%{categories: categories}) do
    for(category <- categories, do: data(category))
  end

  @doc """
  Renders a single category.
  """
  def show(%{category: category}) do
    data(category)
  end

  defp data(category) do
    %{
      id: category.id,
      name: category.name
    }
  end
end

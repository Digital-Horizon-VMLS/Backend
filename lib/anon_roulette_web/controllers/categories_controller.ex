defmodule AnonRouletteWeb.CategoriesController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Categories
  action_fallback AnonRouletteWeb.ErrorController

  def index(conn, _params) do
    category = Categories.all_category()
    render(conn, :index, categories: category)
  end

  def show(conn, %{"category_id" => id}) do
    with {:ok, category} <- Categories.get_category(id) do
      render(conn, :show, category: category)
    end
  end
end

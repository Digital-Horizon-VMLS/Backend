defmodule AnonRouletteWeb.CategoriesController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Categories
  alias AnonRouletteWeb.Utils

  action_fallback AnonRouletteWeb.ErrorController

  def index(conn, _params) do
    category = Categories.all_category()
    render(conn, :index, categories: category)
  end

  def show(conn, %{"category_id" => category_id}) do
    with {:ok, category_id} <- Utils.parse_id(category_id),
         {:ok, category} <- Categories.get_category(category_id) do
      render(conn, :show, category: category)
    end
  end
end

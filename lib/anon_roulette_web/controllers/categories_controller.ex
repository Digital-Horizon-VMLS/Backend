defmodule AnonRouletteWeb.CategoriesController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Categories

  action_fallback AnonRouletteWeb.ErrorController

  def index(conn, _params) do
    category = Categories.all_category()
    render(conn, :index, categories: category)
  end

  def show(conn, %{"category_id" => id}) do
    # case Repo.get(Category, id) do
    #  %Category{} = category ->
    #    conn
    #    |> put_status(:ok)
    #    |> render(:show, category: category)
    #
    # nil ->
    #   conn
    #  |> put_status(:not_found)
    # |> json(%{error: "Category not found"})
    # end
    with {:ok, category} <- Categories.get_category(id) do
      render(conn, :show, category: category)
    end
  end
end

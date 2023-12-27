defmodule AnonRouletteWeb.CategoriesController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.{Repo, Category}

  @categories_mock [
    %{
      id: 1,
      name: "Sports"
    },
    %{
      id: 2,
      name: "Politics"
    },
    %{
      id: 3,
      name: "Religion"
    },
    %{
      id: 4,
      name: "Technology"
    }
  ]

  # TODO: Implement functionality
  def index(conn, _params) do
    category = Repo.all(Category)
    render(conn, :index, categories: category)
  end

  # TODO: Implement functionality
  def show(conn, %{"category_id" => id}) do
    case Repo.get(Category, id) do
      %Category{} = category ->
        conn
        |> put_status(:ok)
        |> render(:show, category: category)

      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Category not found"})
    end
  end
end

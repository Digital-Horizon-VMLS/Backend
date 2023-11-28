defmodule AnonRouletteWeb.CategoriesController do
  use AnonRouletteWeb, :controller

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
    render(conn, :index, categories: @categories_mock)
  end

  # TODO: Implement functionality
  def show(conn, %{"category_id" => id}) do
    category =
      Enum.find(
        @categories_mock,
        %{
          id: String.to_integer(id),
          name: "Mock"
        },
        &(&1.id == String.to_integer(id))
      )

    render(conn, :show, category: category)
  end
end

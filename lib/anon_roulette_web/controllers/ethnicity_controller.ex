defmodule AnonRouletteWeb.EthnicityController do
  use AnonRouletteWeb, :controller

  @ethnicities_mock [
    %{
      id: 1,
      name: "African American"
    },
    %{
      id: 2,
      name: "Asian American"
    },
    %{
      id: 3,
      name: "Hispanic"
    },
    %{
      id: 4,
      name: "Caucasian"
    }
  ]

  # TODO: Implement functionality
  def index(conn, _params) do
    render(conn, :index, ethnicities: @ethnicities_mock)
  end

  # TODO: Implement functionality
  def show(conn, %{"ethnicity_id" => id}) do
    ethnicity =
      Enum.find(
        @ethnicities_mock,
        %{
          id: String.to_integer(id),
          name: "Mock"
        },
        &(&1.id == String.to_integer(id))
      )

    render(conn, :show, ethnicity: ethnicity)
  end
end

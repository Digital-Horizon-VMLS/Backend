defmodule AnonRouletteWeb.EthnicityController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Ethnicities

  def index(conn, _params) do
    ethnicities = Ethnicities.all_ethnicities()
    render(conn, :index, ethnicities: ethnicities)
  end

  def show(conn, %{"ethnicity_id" => id}) do
    case Integer.parse(id) do
      {number, _} when is_integer(number) ->
        case Ethnicities.get_ethnicity(number) do
          {:ok, ethnicity} ->
            render(conn, :show, ethnicity: ethnicity)
          
          {:error, :not_found} ->
            conn
            |> put_status(:not_found)
            |> render(:"404", message: "Ethnicity not found")
        end

      _ ->
        conn
        |> put_status(:not_found)
        |> render(:"404", message: "Invalid ethnicity ID")
    end
  end
end

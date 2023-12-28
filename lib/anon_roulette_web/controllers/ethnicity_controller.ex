defmodule AnonRouletteWeb.EthnicityController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.{Repo, Ethnicity}
  action_fallback AnonRouletteWeb.ErrorController

  def index(conn, _params) do
    ethnicities = Repo.all(Ethnicity)
    render(conn, :index, ethnicities: ethnicities)
  end

  def show(conn, %{"ethnicity_id" => id}) do
    case Integer.parse(id) do
      {number, ""} when is_integer(number) ->
        case Repo.get(Ethnicity, number) do
          nil ->
            conn
            |> put_status(:not_found)
            |> render(:"404", message: "Ethnicity not found")

          ethnicity ->
            render(conn, :show, ethnicity: ethnicity)
        end

      _ ->
        conn
        |> put_status(:not_found)
        |> render(:"404", message: "Invalid ethnicity ID")
    end
  end
end

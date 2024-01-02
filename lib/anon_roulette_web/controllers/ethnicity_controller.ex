defmodule AnonRouletteWeb.EthnicityController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Ethnicities
  action_fallback AnonRouletteWeb.ErrorController

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
            {:error, :not_found}
        end

      _ ->
        {:error, :not_found}
    end
  end
end

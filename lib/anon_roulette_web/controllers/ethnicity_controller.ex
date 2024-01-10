defmodule AnonRouletteWeb.EthnicityController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Ethnicities
  alias AnonRouletteWeb.Utils

  action_fallback AnonRouletteWeb.ErrorController

  def index(conn, _params) do
    ethnicities = Ethnicities.all_ethnicities()
    render(conn, :index, ethnicities: ethnicities)
  end

  def show(conn, %{"ethnicity_id" => ethnicity_id}) do
    with {:ok, ethnicity_id} <- Utils.parse_id(ethnicity_id),
         {:ok, ethnicity} <- Ethnicities.get_ethnicity(ethnicity_id) do
      render(conn, :show, ethnicity: ethnicity)
    end
  end
end

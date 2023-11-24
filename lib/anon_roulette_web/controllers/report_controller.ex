defmodule AnonRouletteWeb.ReportController do
  use AnonRouletteWeb, :controller

  # TODO: Implement functionality
  def create(conn, _report_params) do
    conn
    |> send_resp(204, "")
  end
end

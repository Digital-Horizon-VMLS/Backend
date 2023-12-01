defmodule AnonRouletteWeb.AuthErrorHandler do
  @moduledoc """
  Error handler for errors relating to tokens
  """
  import Plug.Conn
  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {:unauthorized, _reason}, _opts) do
    send_resp(conn, 403, "")
  end

  def auth_error(conn, {:unauthenticated, _reason}, _opts) do
    send_resp(conn, 401, "")
  end

  def auth_error(conn, {:invalid_token, _reason}, _opts) do
    send_resp(conn, 401, "")
  end

  def auth_error(conn, {_type, _reason}, _opts) do
    send_resp(conn, 500, "")
  end
end

defmodule AnonRouletteWeb.TokenController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Tokens
  alias AnonRouletteWeb.Utils

  action_fallback AnonRouletteWeb.ErrorController

  def index(conn, _token_params) do
    with %{:user_id => requesting_id} <- Guardian.Plug.current_resource(conn) do
      tokens = Tokens.get_all_tokens(requesting_id)
      render(conn, :index, %{tokens: tokens})
    end
  end

  # /api/tokens/:token_id
  def show(conn, %{"token_id" => id}) do
    with {:ok, id} <- Utils.parse_id(id),
         :ok <- authorized?(conn, id),
         {:ok, token} <- Tokens.get_token(id) do
      render(conn, :show, %{token: token})
    end
  end

  # /api/tokens/:me
  def show(conn, _token_params) do
    with %{"tid" => token_id} <- Guardian.Plug.current_claims(conn),
         {:ok, token} <- Tokens.get_token(token_id) do
      render(conn, :show, %{token: token})
    end
  end

  def create(conn, %{"token" => _, "type" => _} = token_params) do
    # Get user agent header from request and add it to token_params
    token_params =
      Map.put(
        token_params,
        "user_agent",
        List.first(Plug.Conn.get_req_header(conn, "user-agent"))
      )

    with {:ok, refresh_access_tokens} <- Tokens.create_token(token_params) do
      render(conn, :show, %{token: refresh_access_tokens})
    end
  end

  # /api/tokens/:token_id
  def delete(conn, %{"token_id" => id}) do
    with {:ok, id} <- Utils.parse_id(id),
         :ok <- authorized?(conn, id),
         {:ok, _token} <- Tokens.delete_token(id) do
      send_resp(conn, 204, "")
    end
  end

  # /api/tokens/:me
  def delete(conn, _token_params) do
    with %{"tid" => token_id} <- Guardian.Plug.current_claims(conn),
         {:ok, _} <- Tokens.delete_token(token_id) do
      send_resp(conn, 204, "")
    end
  end

  def delete_all(conn, _token_params) do
    with %{:user_id => requesting_id} <- Guardian.Plug.current_resource(conn) do
      Tokens.delete_all_tokens(requesting_id)
      send_resp(conn, 204, "")
    end
  end

  defp authorized?(conn, resource_id) do
    with %{:user_id => requesting_id} <- Guardian.Plug.current_resource(conn),
         {:ok, %{user_id: user_id}} <- Tokens.get_token(resource_id) do
      if requesting_id == user_id do
        :ok
      else
        {:error, :unauthorized}
      end
    end
  end
end

defmodule AnonRouletteWeb.UserController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Users
  alias AnonRouletteWeb.Utils

  action_fallback AnonRouletteWeb.ErrorController

  # api/users/:user_id
  def show(conn, %{"user_id" => user_id}) do
    with {:ok, user_id} <- Utils.parse_id(user_id),
         :ok <- authorized?(conn, user_id),
         {:ok, user} <- Users.get_user_by_id(user_id) do
      render(conn, :show, user: user)
    end
  end

  # api/users/me
  def show(conn, _) do
    with %{"sub" => user_id} <- Guardian.Plug.current_claims(conn),
         {:ok, user} <- Users.get_user_by_id(user_id) do
      render(conn, :show, user: user)
    end
  end

  def create(conn, user_params) do
    with {:ok, user} <- Users.create_user(user_params) do
      render(conn, :show, user: user)
    end
  end

  # /users/:user_id
  def delete(conn, %{"user_id" => user_id}) do
    with {:ok, user_id} <- Utils.parse_id(user_id),
         :ok <- authorized?(conn, user_id),
         {:ok, _user} <- Users.deactivate_user(user_id) do
      send_resp(conn, 204, "")
    end
  end

  # api/users/me
  def delete(conn, _) do
    with %{"sub" => user_id} <- Guardian.Plug.current_claims(conn),
         {:ok, _user} <- Users.deactivate_user(user_id) do
      send_resp(conn, 204, "")
    end
  end

  # api/users/:user_id
  def update(conn, %{"user_id" => user_id} = user_params) do
    with {:ok, user_id} <- Utils.parse_id(user_id),
         :ok <- authorized?(conn, user_id),
         {:ok, user} <- Users.update_user(user_id, user_params) do
      render(conn, :show, user: user)
    end
  end

  # api/users/me
  def update(conn, user_params) do
    with %{"sub" => user_id} <- Guardian.Plug.current_claims(conn),
         {:ok, user} <- Users.update_user(user_id, user_params) do
      render(conn, :show, user: user)
    end
  end

  defp authorized?(conn, resource_id) do
    with %{"sub" => requesting_id} <- Guardian.Plug.current_claims(conn) do
      if requesting_id == resource_id do
        :ok
      else
        {:error, :unauthorized}
      end
    end
  end
end

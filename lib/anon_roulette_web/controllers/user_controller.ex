defmodule AnonRouletteWeb.UserController do
  use AnonRouletteWeb, :controller
  alias AnonRoulette.Resources.Users

  action_fallback AnonRouletteWeb.ErrorController

  # /users/:user_id
  def show(conn, %{"user_id" => id}) do
    id = String.to_integer(id)

    with :ok <- authorized?(conn, id),
         {:ok, user} <- Users.get_user(id) do
      render(conn, :show, user: user)
    end
  end

  # /users/me
  def show(conn, _) do
    with %{:user_id => token_id} <- Guardian.Plug.current_resource(conn),
         {:ok, user} <- Users.get_user(token_id) do
      render(conn, :show, user: user)
    end
  end

  def create(conn, user_params) do
    with {:ok, user} <- Users.create_user(user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"user_id" => id}) do
    id = String.to_integer(id)

    with :ok <- authorized?(conn, id),
         {:ok, _user} <- Users.deactivate_user(id) do
      send_resp(conn, 204, "")
    end
  end

  def update(conn, %{"user_id" => id} = user_params) do
    id = String.to_integer(id)

    with :ok <- authorized?(conn, id),
         {:ok, user} <- Users.update_user(id, user_params) do
      render(conn, :show, user: user)
    end
  end

  defp authorized?(conn, resource_id) do
    with %{:user_id => token_id} <- Guardian.Plug.current_resource(conn) do
      if token_id == resource_id do
        :ok
      else
        {:error, :unauthorized}
      end
    end
  end
end

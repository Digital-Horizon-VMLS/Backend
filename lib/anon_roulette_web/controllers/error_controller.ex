defmodule AnonRouletteWeb.ErrorController do
  use Phoenix.Controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: AnonRouletteWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: AnonRouletteWeb.ErrorJSON)
    |> render(:"404")
  end

  def call(conn, {:error, :invalid_id}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: AnonRouletteWeb.ErrorJSON)
    |> render(:"404")
  end

  def call(conn, {:error, :not_active}) do
    conn
    |> put_status(403)
    |> put_view(json: AnonRouletteWeb.ErrorJSON)
    |> render(:"403")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(403)
    |> put_view(json: AnonRouletteWeb.ErrorJSON)
    |> render(:"403")
  end

  def call(conn, {:error, :unauthenticated}) do
    conn
    |> put_status(401)
    |> put_view(json: AnonRouletteWeb.ErrorJSON)
    |> render(:"401")
  end

  def call(conn, {:error, :invalid_token_type}) do
    conn
    |> put_status(422)
    |> put_view(json: AnonRouletteWeb.ErrorJSON)
    |> render(:"422")
  end
end

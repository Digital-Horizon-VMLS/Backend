defmodule AnonRouletteWeb.TokenController do
  use AnonRouletteWeb, :controller

  # TODO: Implement functionality
  def create(conn, %{"user_id" => id}) do
    # Create refresh token
    {:ok, refresh_token, refresh_claims} =
      AnonRouletteWeb.Guardian.encode_and_sign(%{id: id}, %{}, token_type: :refresh)

    # Create access token
    {:ok, access_token, access_claims} =
      AnonRouletteWeb.Guardian.encode_and_sign(%{id: id}, %{}, token_type: :access)

    render(conn, :show, %{
      refresh: {refresh_token, refresh_claims},
      access: {access_token, access_claims}
    })
  end

  def create(conn, %{"refresh_token" => refresh_token}) do
    # Use refresh token to create access token
    {:ok, _refresh_token, access} =
      AnonRouletteWeb.Guardian.exchange(refresh_token, "refresh", "access")

    render(conn, :show, %{access: access})
  end
end

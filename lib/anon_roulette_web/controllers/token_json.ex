defmodule AnonRouletteWeb.TokenJSON do
  @doc """
  Renders a payload containing a token.
  """
  def show(tokens) do
    data(tokens)
  end

  defp data(%{refresh: refresh, access: access}) do
    {refresh_token, %{"exp" => refresh_expires_in}} = refresh
    {access_token, %{"exp" => access_expires_in}} = access

    %{
      access_token: access_token,
      access_expires_in: access_expires_in,
      refresh_token: refresh_token,
      refresh_expires_in: refresh_expires_in,
      token_type: "Bearer"
    }
  end

  defp data(%{access: access}) do
    {access_token, %{"exp" => access_expires_in}} = access

    %{
      access_token: access_token,
      access_expires_in: access_expires_in,
      token_type: "Bearer"
    }
  end
end

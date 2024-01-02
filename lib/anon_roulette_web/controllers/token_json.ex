defmodule AnonRouletteWeb.TokenJSON do
  @doc """
  Renders a list of tokens.
  """
  def index(%{tokens: tokens}) do
    for(token <- tokens, do: data(token))
  end

  @doc """
  Renders a payload containing a token.
  """
  def show(%{token: token}) do
    data(token)
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

  defp data(token) do
    %{
      token_id: token.token_id,
      user_agent: token.user_agent
    }
  end
end

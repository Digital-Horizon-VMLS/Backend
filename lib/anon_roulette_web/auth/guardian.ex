defmodule AnonRouletteWeb.Guardian do
  @moduledoc """
  Configuarion for access/refresh tokens.
  """
  use Guardian,
    otp_app: :anon_roulette,
    token_ttl: %{"access" => {5, :minutes}, "refresh" => {52, :weeks}}

  alias AnonRoulette.Resources.Users

  def subject_for_token(%{user_id: user_id}, _claims) when is_integer(user_id) do
    # User ID as subject of token
    {:ok, user_id}
  end

  def subject_for_token(_, _) do
    {:error, :no_id}
  end

  def resource_from_claims(%{"sub" => user_id}) do
    Users.get_user_by_id(user_id)
  end

  def resource_from_claims(_claims) do
    {:error, :no_subject}
  end
end

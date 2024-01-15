defmodule AnonRouletteWeb.AuthPipeline do
  @moduledoc """
  Pipeline to find and validate access tokens from the request and load
  the user corresponding to the token.
  """
  use Guardian.Plug.Pipeline,
    otp_app: :anon_roulette,
    module: AnonRouletteWeb.Guardian,
    error_handler: AnonRouletteWeb.AuthErrorHandler,
    key: :user

  @claims %{iss: "anon_roulette", typ: "access"}

  plug Guardian.Plug.VerifySession, claims: @claims
  plug Guardian.Plug.VerifyHeader, claims: @claims, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
end

defmodule AnonRoulette.Resources.Tokens do
  @moduledoc """
  Provides methods to preform CRUD operations on the token resource. The token resource
  represents refresh tokens (logins).
  """
  alias AnonRoulette.Token
  alias AnonRoulette.Resources.Users
  alias AnonRoulette.Repo
  alias AnonRouletteWeb.Guardian
  import Ecto.Query, only: [from: 2]

  @doc """
  Get token struct using id or token
  """
  def get_token(id) when is_integer(id) do
    case Repo.get(Token, id) do
      nil -> {:error, :not_found}
      token = %{} -> {:ok, token}
    end
  end

  def get_token(refresh_token) when is_bitstring(refresh_token) do
    case from(t in Token, where: t.token == ^refresh_token)
         |> Repo.one() do
      nil -> {:error, :not_found}
      token = %{} -> {:ok, token}
    end
  end

  @doc """
  Get token struct that was used to generate the given access token
  """
  def get_token_from_access(access_token) when is_bitstring(access_token) do
    with {:ok, %{"tid" => token_id}} <- Guardian.decode_and_verify(access_token) do
      get_token(token_id)
    end
  end

  @doc """
  Get all token structs belonging to the given user_id
  """
  def get_all_tokens(user_id) when is_integer(user_id) do
    from(t in Token, where: t.user_id == ^user_id) |> Repo.all()
  end

  @doc """
  Create a token using the map given as argument. The token will be
  generated using the given method type.
  """
  def create_token(%{"type" => type, "token" => token} = token_params) do
    generate_token(type, token, Map.get(token_params, "user_agent"))
  end

  @doc """
  Deletes the token with the matching id
  """
  def delete_token(id) when is_integer(id) do
    with {:ok, token} <- get_token(id) do
      token
      |> Repo.delete()
    end
  end

  @doc """
  Delete all tokens belonging to the given user id
  """
  def delete_all_tokens(user_id) do
    from(t in Token, where: t.user_id == ^user_id) |> Repo.delete_all()
  end

  @doc """
  Validates the given refresh token.
  """
  def validate_refresh(refresh_token) do
    with {:ok, refresh_claims} <- Guardian.decode_and_verify(refresh_token) do
      case get_token(refresh_token) do
        {:error, _} -> {:error, :unauthenticated}
        {:ok, %{token_id: refresh_id}} -> {:ok, refresh_token, refresh_claims, refresh_id}
      end
    end
  end

  # Generate an access token by using a refresh token
  defp generate_access(refresh_token) do
    with {:ok, refresh_token, %{"sub" => user_id} = refresh_claims, token_id} <-
           validate_refresh(refresh_token),
         {:ok, access_token, access_claims} <-
           Guardian.encode_and_sign(%{user_id: user_id}, %{tid: token_id}, token_type: :access) do
      {:ok, %{refresh: {refresh_token, refresh_claims}, access: {access_token, access_claims}}}
    end
  end

  # Generate an refresh token and assigns it to the given user id
  defp generate_refresh(user_id, user_agent) do
    with {:ok, refresh_token, refresh_claims} <-
           Guardian.encode_and_sign(%{user_id: user_id}, %{}, token_type: :refresh),
         {:ok, _} <-
           %Token{}
           |> Token.changeset(%{token: refresh_token, user_id: user_id, user_agent: user_agent})
           |> Repo.insert() do
      {:ok, refresh_token, refresh_claims}
    end
  end

  # Generate refresh and/or access token using the given token.
  defp generate_token("refresh", refresh_token, _user_agent) do
    generate_access(refresh_token)
  end

  # TODO: Remove before production
  defp generate_token("id", user_id, user_agent) do
    with {:ok, _user} <- Users.get_user_by_id(user_id),
         {:ok, refresh_token, _refresh_claims} <- generate_refresh(user_id, user_agent) do
      generate_access(refresh_token)
    end
  end

  defp generate_token(_type, _token, _user_agent) do
    {:error, :invalid_token_type}
  end
end

defmodule AnonRoulette.Resources.Users do
  @moduledoc """
  Provides methods to preform CRUD operations on the user resource.
  """
  alias AnonRoulette.User
  alias AnonRoulette.Repo

  @doc """
  Get user using either id or email
  """
  def get_user_by_id(id) when is_integer(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      %{is_active: false} -> {:error, :not_active}
      user = %{} -> {:ok, user}
    end
  end

  def get_user_by_email(email) when is_bitstring(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :not_found}
      %{data: %{is_active: false}} -> {:error, :not_active}
      user = %{} -> {:ok, user}
    end
  end

  @doc """
  Create a user using the map given as argument. The map can use
  either strings or atoms as keys. Mixed type keys are not allowed.

  Example attrs:
    %{
        username: "johndoe",
        email: "johndoe@email.com"
    }
  """
  def create_user(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user with matching id using the map given as the 2nd argument.
  The map can use either strings or atoms as keys. Mixed type keys
  are not allowed.

  Example attrs:
    %{
        first_name: "John",
        last_name: "",
        profile_description: "I have no last name"
    }
  """
  def update_user(id, attrs) do
    with {:ok, user} <- get_user_by_id(id) do
      user
      |> User.patch_changeset(attrs)
      |> Repo.update()
    end
  end

  @doc """
  Deactivates the user with the matching id
  """
  def deactivate_user(id) do
    with {:ok, user} <- get_user_by_id(id) do
      user
      |> User.delete_changeset()
      |> Repo.update()
    end
  end
end

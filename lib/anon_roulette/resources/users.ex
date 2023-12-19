defmodule AnonRoulette.Resources.Users do
  alias AnonRoulette.User
  alias AnonRoulette.Repo

  def get_user(id) when is_integer(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      %{is_active: false} -> {:error, :not_active}
      user = %{} -> {:ok, user}
    end
  end

  def get_user(email) when is_bitstring(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :not_found}
      %{data: %{is_active: false}} -> {:error, :not_active}
      user = %{} -> {:ok, user}
    end
  end

  def create_user(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end

  def update_user(id, attrs) when is_integer(id) do
    with {:ok, user} <- get_user(id) do
      user
      |> User.patch_changeset(attrs)
      |> Repo.update()
    end
  end

  def deactivate_user(id) when is_integer(id) do
    with {:ok, user} <- get_user(id) do
      user
      |> User.delete_changeset()
      |> Repo.update()
    end
  end
end

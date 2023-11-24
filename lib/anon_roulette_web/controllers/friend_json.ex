defmodule AnonRouletteWeb.FriendJSON do
  @doc """
  Renders a list of friends.
  """
  def index(%{friends: friends}) do
    for(friend <- friends, do: data(friend))
  end

  @doc """
  Renders a single friend.
  """
  def show(%{friend: friend}) do
    data(friend)
  end

  defp data(friend) do
    %{
      id: friend.id,
      username: friend.username,
      email: friend.email,
      profilePicture: friend.profile_picture,
      firstName: friend.first_name,
      lastName: friend.last_name,
      birthDate: friend.birth_date,
      ethnicity: friend.ethnicity
    }
  end
end

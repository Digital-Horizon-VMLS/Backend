defmodule AnonRouletteWeb.UserJSON do
  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    data(user)
  end

  defp data(user) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      profilePicture: user.profile_picture,
      description: user.description,
      firstName: user.first_name,
      lastName: user.last_name,
      birthDate: user.birth_date,
      ethnicity: user.ethnicity,
      anonymous: user.anonymous
    }
  end
end

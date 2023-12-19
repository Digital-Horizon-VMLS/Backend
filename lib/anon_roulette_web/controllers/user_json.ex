defmodule AnonRouletteWeb.UserJSON do
  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    data(user)
  end

  defp data(user) do
    %{
      id: user.user_id,
      username: user.username,
      email: user.email,
      profile_picture_id: user.profile_picture_id,
      profile_description: user.profile_description,
      first_name: user.first_name,
      last_name: user.last_name,
      birth_date: user.birth_date,
      ethnic_id: user.ethnic_id
    }
  end
end

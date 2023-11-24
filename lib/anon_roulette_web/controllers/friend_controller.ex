defmodule AnonRouletteWeb.FriendController do
  use AnonRouletteWeb, :controller

  @friends_mock [
    %{
      id: 2,
      username: "janethevisible",
      email: "janedoe@email.com",
      profile_picture:
        "https://en.wikipedia.org/wiki/Jane_(given_name)#/media/File:Streathamladyjayne.jpg",
      first_name: "Jane",
      last_name: "Doe",
      birth_date: ~D[1994-02-03],
      ethnicity: "Hispanic"
    },
    %{
      id: 4,
      username: "gerbilsforlife",
      email: "gerbillover@email.com",
      profile_picture:
        "https://en.wikipedia.org/wiki/Mongolian_gerbil#/media/File:Meriones_unguiculatus_(wild).jpg",
      first_name: "Alden",
      last_name: "Luukuroff",
      birth_date: ~D[1987-09-04],
      ethnicity: "Asian American"
    }
  ]

  # TODO: Implement functionality
  def index(conn, _params) do
    render(conn, :index, friends: @friends_mock)
  end

  # TODO: Implement functionality
  def show(conn, %{"friend_id" => id}) do
    friend =
      Enum.find(
        @friends_mock,
        %{
          id: String.to_integer(id),
          username: "mock",
          email: "mock@email.com",
          profile_picture: "https://en.wikipedia.org/static/images/icons/wikipedia.png",
          first_name: "Mock",
          last_name: "Mock",
          birth_date: ~D[2001-01-01],
          ethnicity: "Mock"
        },
        &(&1.id == String.to_integer(id))
      )

    render(conn, :show, friend: friend)
  end

  # TODO: Implement functionality
  def delete(conn, %{"friend_id" => _id}) do
    conn
    |> send_resp(204, "")
  end
end

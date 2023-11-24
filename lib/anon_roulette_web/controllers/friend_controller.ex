defmodule AnonRouletteWeb.FriendController do
  use AnonRouletteWeb, :controller

  @friends_mock [
    %{
      id: 2,
      username: "janethevisible",
      email: "janedoe@email.com",
      profile_picture:
        "https://en.wikipedia.org/wiki/Jane_(given_name)#/media/File:Streathamladyjayne.jpg",
      description:
        "Hey, lovely souls! I'm Jane, your friendly neighborhood dreamer with a heart full of wanderlust. By day, you can find me lost in the pages of a good book, and by night, I'm chasing sunsets and stargazing.",
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
      description:
        "As a self-proclaimed Gerbil Dad, I'm on a mission to spread the love for these underrated pets. Join me on this adventure of fluffy tails, tiny paws, and heartwarming squeaks. Let's exchange tips on creating the ultimate gerbil paradise and share stories of our little buddies' antics.",
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
          description: "Mock",
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

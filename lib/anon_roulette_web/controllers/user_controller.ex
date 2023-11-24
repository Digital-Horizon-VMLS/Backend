defmodule AnonRouletteWeb.UserController do
  use AnonRouletteWeb, :controller

  @users_mock [
    %{
      id: 1,
      username: "johntheanon",
      email: "johndoe@email.com",
      profile_picture:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/John_and_Jane_Doe_Headstones.jpg",
      first_name: "John",
      last_name: "Doe",
      birth_date: ~D[2000-01-01],
      ethnicity: "African American",
      anonymous: true
    },
    %{
      id: 2,
      username: "janethevisible",
      email: "janedoe@email.com",
      profile_picture:
        "https://en.wikipedia.org/wiki/Jane_(given_name)#/media/File:Streathamladyjayne.jpg",
      first_name: "Jane",
      last_name: "Doe",
      birth_date: ~D[1994-02-03],
      ethnicity: "Hispanic",
      anonymous: false
    },
    %{
      id: 3,
      username: "troll",
      email: "rubberduck@email.com",
      profile_picture: "https://en.wikipedia.org/wiki/Troll#/media/File:John_Bauer_1915.jpg",
      first_name: "Frank",
      last_name: "Brook",
      birth_date: ~D[1980-04-12],
      ethnicity: "Caucasian",
      anonymous: true
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
      ethnicity: "Asian American",
      anonymous: true
    }
  ]

  # TODO: Implement functionality
  def show(conn, %{"user_id" => id}) do
    user =
      Enum.find(
        @users_mock,
        %{
          id: String.to_integer(id),
          username: "mock",
          email: "mock@email.com",
          profile_picture: "https://en.wikipedia.org/static/images/icons/wikipedia.png",
          first_name: "Mock",
          last_name: "Mock",
          birth_date: ~D[2001-01-01],
          ethnicity: "Mock",
          anonymous: true
        },
        &(&1.id == String.to_integer(id))
      )

    render(conn, :show, user: user)
  end

  # TODO: Implement functionality
  def create(conn, user_params) do
    user = %{
      id: Enum.random(5..10_000),
      username: Map.get(user_params, "username"),
      email: Map.get(user_params, "email"),
      profile_picture: "https://en.wikipedia.org/static/images/icons/wikipedia.png",
      first_name: nil,
      last_name: nil,
      birth_date: nil,
      ethnicity: nil,
      anonymous: true
    }

    render(conn, :show, user: user)
  end

  # TODO: Implement functionality
  def delete(conn, %{"user_id" => _id, "password" => _password}) do
    conn
    |> send_resp(204, "")
  end

  # TODO: Implement functionality
  def update(conn, %{"user_id" => _id}) do
    conn
    |> send_resp(204, "")
  end
end

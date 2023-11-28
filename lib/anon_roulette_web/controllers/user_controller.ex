defmodule AnonRouletteWeb.UserController do
  use AnonRouletteWeb, :controller

  @users_mock [
    %{
      id: 1,
      username: "johntheanon",
      email: "johndoe@email.com",
      profile_picture:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/John_and_Jane_Doe_Headstones.jpg",
      description:
        "Hey there! I'm John, your friendly neighborhood explorer. By day, I'm immersed in the world of technology, and by night, I'm chasing sunsets and new experiences. Music is my therapy, and I believe a good playlist can change your mood in an instant.",
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
      description:
        "Hey, lovely souls! I'm Jane, your friendly neighborhood dreamer with a heart full of wanderlust. By day, you can find me lost in the pages of a good book, and by night, I'm chasing sunsets and stargazing.",
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
      description:
        "Sup, internet pals! I'm Frank Brook, your friendly neighborhood troll. 🌐 Here to sprinkle a little chaos into your feed and keep you on your toes. Life's too short to be serious, am I right?",
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
      description:
        "As a self-proclaimed Gerbil Dad, I'm on a mission to spread the love for these underrated pets. Join me on this adventure of fluffy tails, tiny paws, and heartwarming squeaks. Let's exchange tips on creating the ultimate gerbil paradise and share stories of our little buddies' antics.",
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
          description: "Mock",
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
      description: nil,
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

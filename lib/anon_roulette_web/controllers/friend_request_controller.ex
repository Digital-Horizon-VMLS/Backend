defmodule AnonRouletteWeb.FriendRequestController do
  use AnonRouletteWeb, :controller

  @friend_requests_mock [
    %{
      id: 1,
      sender: 1,
      recipient: 2,
      message:
        "I noticed we're into some similar stuff. You are awesome, and I thought it'd be cool to connect! 😊",
      status: "ACCEPTED",
      sent_date: ~D[2023-02-11]
    },
    %{
      id: 3,
      sender: 3,
      recipient: 1,
      message:
        "I figured I'd hit you up with a friend request because, you know, why not add a little chaos to your life? 😈",
      status: "REJECTED",
      sent_date: ~D[2023-04-05]
    },
    %{
      id: 3,
      sender: 3,
      recipient: 1,
      message: "Accept my request, and let the trolling begin! 🙌😜 #SorryNotSorry #TrollLife",
      status: "PENDING",
      sent_date: ~D[2023-04-06]
    },
    %{
      id: 4,
      sender: 1,
      recipient: 4,
      message:
        "Hey there! 🐹 I couldn't help but notice your profile and saw you're into animals. Me too! 🐾 Especially gerbils - they're like the tiny acrobats of the rodent world, don't you think? 😄 Anyway, thought it'd be cool to connect with a fellow critter enthusiast. Feel free to hit me up if you're up for some gerbil chat or anything else! Cheers! 🌈",
      status: "ACCEPTED",
      sent_date: ~D[2023-05-10]
    }
  ]

  # TODO: Implement functionality
  def index(conn, _params) do
    render(conn, :index, friend_requests: @friend_requests_mock)
  end

  # TODO: Implement functionality
  def show(conn, %{"friend_request_id" => id}) do
    friend_request =
      Enum.find(
        @friend_requests_mock,
        %{
          id: String.to_integer(id),
          sender: 1,
          recipient: Enum.random(5..100_000),
          message: "Mock",
          status: Enum.random(["PENDING", "REJECTED", "ACCEPTED"]),
          sent_date: ~D[2023-01-01]
        },
        &(&1.id == String.to_integer(id))
      )

    render(conn, :show, friend_request: friend_request)
  end

  # TODO: Implement functionality
  def create(conn, friend_request_params) do
    friend_request = %{
      id: Enum.random(5..100_000),
      sender: 1,
      recipient: Map.get(friend_request_params, "recipient"),
      message: Map.get(friend_request_params, "message"),
      status: "PENDING",
      sent_date: Date.utc_today()
    }

    render(conn, :show, friend_request: friend_request)
  end

  # TODO: Implement functionality
  def update(conn, %{"friend_request_id" => _id}) do
    conn
    |> send_resp(204, "")
  end
end

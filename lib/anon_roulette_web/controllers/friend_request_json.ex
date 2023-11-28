defmodule AnonRouletteWeb.FriendRequestJSON do
  @doc """
  Renders a list of friend requests.
  """
  def index(%{friend_requests: friend_requests}) do
    for(friend_request <- friend_requests, do: data(friend_request))
  end

  @doc """
  Renders a single friend request.
  """
  def show(%{friend_request: friend_request}) do
    data(friend_request)
  end

  defp data(friend_request) do
    %{
      id: friend_request.id,
      sender: friend_request.sender,
      recipient: friend_request.recipient,
      message: friend_request.message,
      status: friend_request.status,
      sentDate: friend_request.sent_date
    }
  end
end

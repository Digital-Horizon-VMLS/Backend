defmodule AnonRoulette.FriendRequest do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:friend_request_id, :id, autogenerate: true}
  schema "friend_requests" do
    field :status, :string
    field :sent_date, :date

    # FK from users table
    belongs_to :from_request, AnonRoulette.User, foreign_key: :requester_id
    belongs_to :to_request, AnonRoulette.User, foreign_key: :receiver_id

    # timestamps()
  end
end

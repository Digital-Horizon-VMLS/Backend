defmodule AnonRoulette.FriendRequest do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  @primary_key {:friend_request_id, :id, autogenerate: true}
  schema "friend_request" do
    field :status, :string
    field :sent_date, :date

    # FK from users table
    belongs_to :from_request, AnonRoulette.User, foreign_key: :requester_id, references: :user_id
    belongs_to :to_request, AnonRoulette.User, foreign_key: :receiver_id, references: :user_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  @date_regex ~r/^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/
  def changeset(friend_request, attrs) do
    friend_request
    |> cast(attrs, [:status, :sent_date, :requester_id, :receiver_id])
    |> validate_required([:status, :sent_date, :requester_id, :receiver_id])
    |> validate_format(:sent_date, @date_regex)
    |> unique_constraint(:status)
    |> foreign_key_constraint(:requester_id)
    |> foreign_key_constraint(:receiver_id)
  end
end

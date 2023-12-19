defmodule AnonRoulette.User do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:user_id, :id, autogenerate: true}
  schema "user" do
    field :username, :string
    field :email, :string, redact: true
    field :first_name, :string
    field :last_name, :string
    field :birth_date, :date
    field :profile_description, :string
    field :is_active, :boolean

    # FK from ethnicity table
    belongs_to :ethnicity, AnonRoulette.Ethnicity, foreign_key: :ethnic_id, references: :ethnic_id

    # FK from profile_pictures table
    belongs_to :profile_picture, AnonRoulette.ProfilePicture, references: :profile_picture_id

    # FK for reports table
    has_many :sender_reports, AnonRoulette.Report, foreign_key: :sender_id
    has_many :offender_reports, AnonRoulette.Report, foreign_key: :offender_id

    # FK for private_messages table
    has_many :messages_from, AnonRoulette.PrivateMessage, foreign_key: :from_user_id
    has_many :messages_to, AnonRoulette.PrivateMessage, foreign_key: :to_user_id

    # FK for friend_requests table
    has_many :requests_from, AnonRoulette.FriendRequest, foreign_key: :requester_id
    has_many :requests_to, AnonRoulette.FriendRequest, foreign_key: :receiver_id

    # FK and PK for many-to-many users_roulette table
    many_to_many :session, AnonRoulette.RouletteSession,
      join_through: "users_roulette",
      join_keys: [user_id: :user_id, roulette_session_id: :roulette_session_id]

    # FK for event_messages table
    has_many :event_message, AnonRoulette.EventMessage, foreign_key: :sender_id

    # FK for event_connections table
    has_many :event_connection, AnonRoulette.EventConnection, foreign_key: :user_id

    timestamps()
  end
end

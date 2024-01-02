defmodule AnonRoulette.User do
  use Ecto.Schema
  import Ecto.Changeset

  # TODO: Implement age restriction validation
  # TODO: Implement username restriction (invalid characters, blacklist, ect) if needed
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

    # FK for token table
    has_many :token, AnonRoulette.Token, foreign_key: :user_id

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

  @email_regex ~r<(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])>
  def create_changeset(user, attrs) do
    user
    |> cast(attrs, [
      :username,
      :email,
      :first_name,
      :last_name,
      :birth_date,
      :profile_description,
      :ethnic_id
    ])
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_length(:username, max: 60)
    |> validate_length(:email, max: 255)
    |> validate_format(:email, @email_regex)
    |> validate_length(:first_name, max: 60)
    |> validate_length(:last_name, max: 60)
    |> validate_length(:profile_description, max: 255)
    |> foreign_key_constraint(:ethnic_id)
  end

  def patch_changeset(user, attrs) do
    user
    |> cast(attrs, [
      :username,
      :first_name,
      :last_name,
      :birth_date,
      :profile_description,
      :ethnic_id
    ])
    |> validate_required(:username)
    |> unique_constraint(:username)
    |> validate_length(:username, max: 60)
    |> validate_length(:first_name, max: 60)
    |> validate_length(:last_name, max: 60)
    |> validate_length(:profile_description, max: 255)
    |> validate_length(:email, max: 255)
    |> validate_format(:email, @email_regex)
    |> foreign_key_constraint(:ethnic_id)
  end

  def delete_changeset(user) do
    cast(
      user,
      %{
        email: nil,
        first_name: nil,
        last_name: nil,
        birth_date: nil,
        profile_description: nil,
        ethnic_id: nil,
        is_active: false
      },
      [
        :email,
        :first_name,
        :last_name,
        :birth_date,
        :profile_description,
        :ethnic_id,
        :is_active
      ]
    )
  end
end

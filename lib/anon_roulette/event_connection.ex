defmodule AnonRoulette.EventConnection do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  # @primary_key {:event_connection_id, :uuid, autogenerate: false}
  schema "event_connection" do
    field :type, :string

    # FK from event table
    belongs_to :event, AnonRoulette.Event,
      foreign_key: :event_connection_id,
      references: :event_id

    # FK from users table
    belongs_to :user, AnonRoulette.User, foreign_key: :user_id, references: :user_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(event_connection, attrs) do
    event_connection
    |> cast(attrs, [:type, :event_connection_id, :user_id])
    |> validate_required([:type, :event_connection_id, :user_id])
    |> foreign_key_constraint(:event_connection_id)
    |> foreign_key_constraint(:user_id)

    # |> unique_constraint(:email)
  end
end

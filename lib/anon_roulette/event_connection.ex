defmodule AnonRoulette.EventConnection do
  use Ecto.Schema

  # This defines the database table for the schema
  # @primary_key {:event_connection_id, :uuid, autogenerate: false}
  schema "event_connections" do
    field :type, :string

    # FK from event table
    belongs_to :event, AnonRoulette.Event,
      foreign_key: :event_connection_id,
      references: :event_id

    # FK from users table
    belongs_to :user, AnonRoulette.User, foreign_key: :user_id, references: :user_id

    # timestamps()
  end
end

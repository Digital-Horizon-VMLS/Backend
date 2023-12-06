defmodule AnonRoulette.EventMessage do
  use Ecto.Schema

  # This defines the database table for the schema
  # @primary_key {:event_message_id, :integer, autogenerate: false}
  schema "event_message" do
    field :message, :string

    # FK from events table
    belongs_to :event, AnonRoulette.Event,
      foreign_key: :event_message_id,
      references: :event_id

    # FK from users table
    belongs_to :user, AnonRoulette.User, foreign_key: :sender_id, references: :user_id
    # timestamps()
  end
end

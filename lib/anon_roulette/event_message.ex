defmodule AnonRoulette.EventMessage do
  use Ecto.Schema
  import Ecto.Changeset
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
    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(event_message, attrs) do
    event_message
    |> cast(attrs, [:message, :event_message_id, :sender_id])
    |> validate_required([:message, :event_message_id, :sender_id])
    |> foreign_key_constraint(:sender_id)
  end
end

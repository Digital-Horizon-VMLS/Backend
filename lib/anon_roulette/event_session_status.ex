defmodule AnonRoulette.EventSessionStatus do
  use Ecto.Schema

  # This defines the database table for the schema
  # @primary_key {:event_session_status_id, :integer, autogenerate: false}
  schema "event_session_status" do
    field :type, :string

    belongs_to :event, AnonRoulette.Event,
      foreign_key: :event_session_status_id,
      references: :event_id

    # timestamps()
  end
end

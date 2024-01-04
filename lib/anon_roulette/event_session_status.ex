defmodule AnonRoulette.EventSessionStatus do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  # @primary_key {:event_session_status_id, :integer, autogenerate: false}
  schema "event_session_status" do
    field :type, :string

    belongs_to :event, AnonRoulette.Event,
      foreign_key: :event_session_status_id,
      references: :event_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(event_session_status, attrs) do
    event_session_status
    |> cast(attrs, [:type, :event_session_status_id])
    |> validate_required([:type, :event_session_status_id])
    |> foreign_key_constraint(:event_session_status_id)
  end
end

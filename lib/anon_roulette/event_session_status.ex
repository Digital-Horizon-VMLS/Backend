defmodule AnonRoulette.EventSessionStatus do
  use Ecto.Schema

  # This defines the database table for the schema
  # @primary_key {:event_session_status_id, :integer, autogenerate: false}
  schema "event_session_status" do
    field :type, :string

    # timestamps()
  end
end

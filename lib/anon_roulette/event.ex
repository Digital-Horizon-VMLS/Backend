defmodule AnonRoulette.Event do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:event_id, :id, autogenerate: true}
  schema "event" do
    field :timestamp, :integer

    # FK from roulette_sessions table
    belongs_to :session, AnonRoulette.RouletteSession,
      foreign_key: :roulette_session_id,
      references: :roulette_session_id

    # FK for event_messages table
    has_many :event_message, AnonRoulette.EventMessage, foreign_key: :event_message_id

    # FK for event_connections table
    has_many :event_connection, AnonRoulette.EventConnection, foreign_key: :event_connection_id
    # FK for event_session_status table
    has_many :event_status, AnonRoulette.EventSessionStatus, foreign_key: :event_session_status_id

    # FK for event_votes table
    has_many :event_vote, AnonRoulette.EventVote, foreign_key: :event_vote_id

    # timestamps()
  end
end

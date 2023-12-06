defmodule AnonRoulette.EventVote do
  use Ecto.Schema

  # This defines the database table for the schema
  # @primary_key {:event_vote_id, :integer, autogenerate: false}
  schema "event_vote" do
    field :yes_vote, :boolean
    field :no_vote, :boolean

    belongs_to :event, AnonRoulette.Event, foreign_key: :event_vote_id, references: :event_id
    # timestamps()
  end
end

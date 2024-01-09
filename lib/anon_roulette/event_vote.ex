defmodule AnonRoulette.EventVote do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  # @primary_key {:event_vote_id, :integer, autogenerate: false}
  schema "event_vote" do
    field :yes_vote, :boolean
    field :no_vote, :boolean

    belongs_to :event, AnonRoulette.Event, foreign_key: :event_vote_id, references: :event_id
    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(event_vote, attrs) do
    event_vote
    |> cast(attrs, [:yes_vote, :no_vote, :event_vote_id])
    |> validate_required([:yes_vote, :no_vote, :event_vote_id])
    |> foreign_key_constraint(:event_vote_id)
  end
end

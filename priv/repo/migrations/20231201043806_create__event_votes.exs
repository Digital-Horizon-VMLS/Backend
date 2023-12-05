defmodule AnonRoulette.Repo.Migrations.Create_EventVotes do
  use Ecto.Migration

  def change do
    create table(:event_votes, primary_key: false) do
      add :event_vote_id,
          references("events",
            column: :event_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true

      add :yes_vote, :boolean
      add :no_vote, :boolean
    end
  end
end

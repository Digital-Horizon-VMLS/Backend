defmodule AnonRoulette.Repo.Migrations.Create_EventVotes do
  use Ecto.Migration

  def change do
    create table(:event_vote, primary_key: false) do
      add :event_vote_id,
          references("event",
            column: :event_id,
            on_delete: :delete_all
          ),
          primary_key: true

      add :yes_vote, :boolean
      add :no_vote, :boolean
      timestamps()
    end
  end
end

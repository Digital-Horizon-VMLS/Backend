defmodule AnonRoulette.Repo.Migrations.Create_EventVotes do
  use Ecto.Migration

  def change do
    create table(:votes, primary_key: false) do
      add :event_id, :uuid, primary_key: true
      add :yes_vote, :boolean
      add :no_vote, :boolean
    end
  end
end

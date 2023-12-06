defmodule AnonRoulette.Repo.Migrations.Create_RouletteSessions do
  use Ecto.Migration

  def change do
    create table(:roulette_session, primary_key: false) do
      add :roulette_session_id, :id, primary_key: true
    end
  end
end

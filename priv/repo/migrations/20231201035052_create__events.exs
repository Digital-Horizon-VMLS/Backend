defmodule AnonRoulette.Repo.Migrations.Create_Events do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :event_id, :uuid, primary_key: true
      add :roulette_session_id, references("roulette_sessions", on_delete: :nothing, type: :integer)
      add :timestamp, :integer
    end
  end
end

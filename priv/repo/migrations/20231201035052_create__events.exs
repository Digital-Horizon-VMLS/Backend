defmodule AnonRoulette.Repo.Migrations.Create_Events do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :event_id, :id, primary_key: true

      add :roulette_session_id,
          references("roulette_sessions",
            column: :roulette_session_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true

      add :timestamp, :integer
    end
  end
end

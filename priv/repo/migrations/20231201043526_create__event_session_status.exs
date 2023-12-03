defmodule AnonRoulette.Repo.Migrations.Create_EventSessionStatus do
  use Ecto.Migration

  def change do
    create table(:event_session_status, primary_key: false) do
      add :event_id, :uuid, primary_key: true
      add :type, :string
    end
  end
end

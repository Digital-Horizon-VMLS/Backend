defmodule AnonRoulette.Repo.Migrations.Create_EventConnections do
  use Ecto.Migration

  def change do
    create table(:event_connections, primary_key: false) do
      add :event_id, :uuid, primary_key: true
      add :user_id, #FK
      add :type, :string
    end
  end
end

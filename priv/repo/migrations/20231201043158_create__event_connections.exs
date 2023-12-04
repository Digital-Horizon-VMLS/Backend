defmodule AnonRoulette.Repo.Migrations.Create_EventConnections do
  use Ecto.Migration

  def change do
    create table(:event_connections, primary_key: false) do
      add :event_connection_id, references("events", on_delete: :nothing, type: :integer, primary_key: true)
      add :user_id, references("users", on_delete: :nothing, type: :integer)
      add :type, :string
    end
  end
end

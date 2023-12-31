defmodule AnonRoulette.Repo.Migrations.Create_EventConnections do
  use Ecto.Migration

  def change do
    create table(:event_connection, primary_key: false) do
      add :event_connection_id,
          references("event",
            column: :event_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true

      add :user_id, references("user", column: :user_id, on_delete: :nothing)
      add :type, :string
    end
  end
end

defmodule AnonRoulette.Repo.Migrations.Create_EventMessages do
  use Ecto.Migration

  def change do
    create table(:event_messages, primary_key: false) do
      add :event_id, :uuid, primary_key: true
      add :sender_id, #FK
      add :message, :string
    end
  end
end

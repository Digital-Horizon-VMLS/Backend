defmodule AnonRoulette.Repo.Migrations.Create_EventMessages do
  use Ecto.Migration

  def change do
    create table(:event_messages, primary_key: false) do
      add :event_message_id,
          references("events",
            column: :event_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true

      add :sender_id, references("users", column: :user_id, on_delete: :nothing, type: :integer)
      add :message, :string
    end
  end
end

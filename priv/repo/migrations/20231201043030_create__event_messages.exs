defmodule AnonRoulette.Repo.Migrations.Create_EventMessages do
  use Ecto.Migration

  def change do
    create table(:event_message, primary_key: false) do
      add :event_message_id,
          references("event",
            column: :event_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true

      add :sender_id, references("user", column: :user_id, on_delete: :nothing, type: :integer)
      add :message, :string
    end
  end
end

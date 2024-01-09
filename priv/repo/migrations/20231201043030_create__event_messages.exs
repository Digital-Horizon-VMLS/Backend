defmodule AnonRoulette.Repo.Migrations.Create_EventMessages do
  use Ecto.Migration

  def change do
    create table(:event_message, primary_key: false) do
      add :event_message_id,
          references("event",
            column: :event_id,
            on_delete: :delete_all
          ),
          primary_key: true

      add :sender_id, references("user", column: :user_id, on_delete: :nilify_all)
      add :message, :string
      timestamps()
    end
  end
end

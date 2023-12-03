defmodule AnonRoulette.Repo.Migrations.Create_PrivateMessages do
  use Ecto.Migration

  def change do
    create table(:private_messages, primary_key: false) do
      add :message_id, :uuid, primary_key: true
      add :from_user, #FK
      add :to_user, #FK
      add :text_message, :string
      add :sent_date, :string
    end
  end
end

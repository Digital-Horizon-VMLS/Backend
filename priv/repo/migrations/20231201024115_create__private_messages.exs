defmodule AnonRoulette.Repo.Migrations.Create_PrivateMessages do
  use Ecto.Migration

  def change do
    create table(:private_messages, primary_key: false) do
      add :message_id, :uuid, primary_key: true
      add :from_user, references("users", on_delete: :nothing, type: :integer)
      add :to_user, references("users", on_delete: :nothing, type: :integer)
      add :text_message, :string
      add :sent_date, :string
    end
  end
end

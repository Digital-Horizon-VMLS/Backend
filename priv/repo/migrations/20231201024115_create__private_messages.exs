defmodule AnonRoulette.Repo.Migrations.Create_PrivateMessages do
  use Ecto.Migration

  def change do
    create table(:private_message, primary_key: false) do
      add :message_id, :id, primary_key: true

      add :from_user_id,
          references("user", column: :user_id, on_delete: :nothing, type: :integer)

      add :to_user_id, references("user", column: :user_id, on_delete: :nothing, type: :integer)
      add :text_message, :string
      add :sent_date, :string
    end
  end
end

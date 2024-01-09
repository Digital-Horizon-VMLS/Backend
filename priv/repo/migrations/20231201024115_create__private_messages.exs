defmodule AnonRoulette.Repo.Migrations.Create_PrivateMessages do
  use Ecto.Migration

  def change do
    create table(:private_message, primary_key: false) do
      add :message_id, :bigserial, primary_key: true

      add :from_user_id,
          references("user", column: :user_id, on_delete: :nilify_all)

      add :to_user_id, references("user", column: :user_id, on_delete: :nilify_all)
      add :text_message, :string
      add :sent_date, :string
      timestamps()
    end
  end
end

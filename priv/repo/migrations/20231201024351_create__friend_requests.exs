defmodule AnonRoulette.Repo.Migrations.Create_FriendRequests do
  use Ecto.Migration

  def change do
    create table(:friend_request, primary_key: false) do
      add :friend_request_id, :bigserial, primary_key: true

      add :requester_id,
          references("user", column: :user_id, on_delete: :nilify_all)

      add :receiver_id, references("user", column: :user_id, on_delete: :nilify_all)
      add :status, :string
      add :sent_date, :date
      timestamps()
    end

    create unique_index(:friend_request, [:status])
  end
end

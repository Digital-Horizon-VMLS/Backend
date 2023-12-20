defmodule AnonRoulette.Repo.Migrations.Create_FriendRequests do
  use Ecto.Migration

  def change do
    create table(:friend_request, primary_key: false) do
      add :friend_request_id, :id, primary_key: true

      add :requester_id,
          references("user", column: :user_id, on_delete: :nothing)

      add :receiver_id, references("user", column: :user_id, on_delete: :nothing)
      add :status, :string
      add :sent_date, :date
    end
  end
end

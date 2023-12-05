defmodule AnonRoulette.Repo.Migrations.Create_FriendRequests do
  use Ecto.Migration

  def change do
    create table(:friend_requests, primary_key: false) do
      add :friend_request_id, :id, primary_key: true

      add :requester_id,
          references("users", column: :user_id, on_delete: :nothing, type: :integer)

      add :receiver_id, references("users", column: :user_id, on_delete: :nothing, type: :integer)
      add :status, :string
      add :sent_date, :date
    end
  end
end

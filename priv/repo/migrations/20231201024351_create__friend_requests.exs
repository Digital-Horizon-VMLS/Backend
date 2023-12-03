defmodule AnonRoulette.Repo.Migrations.Create_FriendRequests do
  use Ecto.Migration

  def change do
    create table(:friend_requests, primary_key: false) do
      add :friend_request_id, :uuid, primary_key: true
      add :requester_id, #FK
      add :receiver_id, #FK
      add :status, :string
      add :sent_date, :date
    end
  end
end

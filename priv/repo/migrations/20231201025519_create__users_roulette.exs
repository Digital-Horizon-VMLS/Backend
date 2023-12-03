defmodule AnonRoulette.Repo.Migrations.Create_UsersRoulette do
  use Ecto.Migration

  def change do
    create table(:users_roulette, primary_key: false) do
      add :user_id, :uuid, primary_key: true
      add :roulette_session_id, #FK
    end
  end
end

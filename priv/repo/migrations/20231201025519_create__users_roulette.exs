defmodule AnonRoulette.Repo.Migrations.Create_UsersRoulette do
  use Ecto.Migration

  def change do
    create table(:users_roulette, primary_key: false) do
      add :user_id, references("users", on_delete: :nothing, type: :integer)
      add :roulette_session_id, references("roulette_sessions", on_delete: :nothing, type: :integer)

    end


  end
end

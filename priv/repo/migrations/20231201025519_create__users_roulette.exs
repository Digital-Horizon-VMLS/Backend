defmodule AnonRoulette.Repo.Migrations.Create_UsersRoulette do
  use Ecto.Migration

  def change do
    create table(:user_roulette, primary_key: false) do
      add :user_id, references("user", column: :user_id, on_delete: :nothing, type: :integer),
        primary_key: true

      add :roulette_session_id,
          references("roulette_session",
            column: :roulette_session_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true
    end
  end
end

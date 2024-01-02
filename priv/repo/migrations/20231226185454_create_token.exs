defmodule AnonRoulette.Repo.Migrations.CreateToken do
  use Ecto.Migration

  def change do
    create table(:token, primary_key: false) do
      add :token_id, :bigserial, primary_key: true
      add :token, :text, null: false
      add :user_agent, :string

      add :user_id,
          references("user", column: :user_id, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:token, [:token])
  end
end

defmodule AnonRoulette.Repo.Migrations.Create_CategoriesRoulette do
  use Ecto.Migration

  def change do
    create table(:categories_roulette, primary_key: false) do
      add :category_id,
          references("categories", column: :category_id, on_delete: :nothing, type: :integer),
          primary_key: true

      add :roulette_session_id,
          references("roulette_sessions",
            column: :roulette_session_id,
            on_delete: :nothing,
            type: :integer
          ),
          primary_key: true
    end
  end
end

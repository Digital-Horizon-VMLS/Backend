defmodule AnonRoulette.Repo.Migrations.Create_CategoriesRoulette do
  use Ecto.Migration

  def change do
    create table(:category_roulette, primary_key: false) do
      add :category_id,
          references("category", column: :category_id, on_delete: :nothing, type: :integer),
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

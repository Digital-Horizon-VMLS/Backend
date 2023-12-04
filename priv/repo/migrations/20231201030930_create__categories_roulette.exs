defmodule AnonRoulette.Repo.Migrations.Create_CategoriesRoulette do
  use Ecto.Migration

  def change do
    create table(:categories_roulette, primary_key: false) do
      add :category_id, references("categories", on_delete: :nothing, type: :integer)
      add :roulette_session_id, references("roulette_sessions", on_delete: :nothing, type: :integer)
    end
  end
end

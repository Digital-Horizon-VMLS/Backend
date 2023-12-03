defmodule AnonRoulette.Repo.Migrations.Create_CategoriesRoulette do
  use Ecto.Migration

  def change do
    create table(:categories_roulette, primary_key: false) do
      # FK
      add :category_id, :uuid, primary_key: true
      add :roulette_session_id, :uuid, primary_key: true
    end
  end
end

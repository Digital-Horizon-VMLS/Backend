defmodule AnonRoulette.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:category, primary_key: false) do
      add :category_id, :id, primary_key: true
      add :name, :string
      add :date_added, :date
    end
  end
end

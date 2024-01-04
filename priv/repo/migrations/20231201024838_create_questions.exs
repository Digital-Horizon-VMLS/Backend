defmodule AnonRoulette.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:question, primary_key: false) do
      add :question_id, :bigserial, primary_key: true

      add :category_id,
          references("category", column: :category_id, on_delete: :delete_all)

      add :question, :string
      timestamps()
    end

    create unique_index(:question, [:question, :category_id])
  end
end

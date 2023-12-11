defmodule AnonRoulette.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:question, primary_key: false) do
      add :question_id, :id, primary_key: true

      add :category_id,
          references("category", column: :category_id, on_delete: :nothing, type: :integer)

      add :question, :string
    end
  end
end

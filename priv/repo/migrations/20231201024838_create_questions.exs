defmodule AnonRoulette.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions, primary_key: false) do
      add :question_id, :uuid, primary_key: true
      add :category_id, references("categories", on_delete: :nothing, type: :integer)
      add :question, :string
    end
  end
end

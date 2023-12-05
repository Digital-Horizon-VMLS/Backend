defmodule AnonRoulette.Question do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:question_id, :id, autogenerate: true}
  schema "questions" do
    field :question, :string

    # FK from categories table
    belongs_to :category, AnonRoulette.Category, foreign_key: :category_id

    # timestamps()
  end
end

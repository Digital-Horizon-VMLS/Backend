defmodule AnonRoulette.Question do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  @primary_key {:question_id, :id, autogenerate: true}
  schema "question" do
    field :question, :string

    # FK from categories table
    belongs_to :category, AnonRoulette.Category,
      foreign_key: :category_id,
      references: :category_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :category_id])
    |> validate_required([:question, :category_id])
    |> unique_constraint(:question)
    |> unique_constraint(:category_id)
    |> foreign_key_constraint(:category_id)
  end
end

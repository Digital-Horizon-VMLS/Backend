defmodule AnonRoulette.CategoryRoulette do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  schema "category_roulette" do
    belongs_to :category, AnonRoulette.Category, references: :category_id
    belongs_to :session, AnonRoulette.RouletteSession, references: :roulette_session_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(category_roulette, attrs) do
    category_roulette
    |> cast(attrs, [:category_id, :roulette_session_id])
    |> validate_required([:category_id, :roulette_session_id])
    |> foreign_key_constraint(:category_id)
    |> foreign_key_constraint(:roulette_session_id)
  end
end

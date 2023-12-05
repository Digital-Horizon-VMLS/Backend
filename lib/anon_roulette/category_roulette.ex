defmodule AnonRoulette.CategoryRoulette do
  use Ecto.Schema

  # This defines the database table for the schema
  schema "categories_roulette" do
    belongs_to :category, AnonRoulette.Category
    belongs_to :session, AnonRoulette.RouletteSession

    # timestamps()
  end

  # This defines changeset functions for creating and updating data
end

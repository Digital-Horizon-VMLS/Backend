defmodule AnonRoulette.Category do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:category_id, :id, autogenerate: true}
  schema "category" do
    field :name, :string
    field :date_added, :date

    # FK for questions table
    has_many :questions, AnonRoulette.Question, foreign_key: :category_id

    # FK and PK for many-to-many categories_roulette table
    many_to_many :session, AnonRoulette.RouletteSession,
      join_through: "categories_roulette",
      join_keys: [category_id: :category_id, roulette_session_id: :roulette_session_id]

    # timestamps()
  end
end

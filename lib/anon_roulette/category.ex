defmodule AnonRoulette.Category do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:category_id, :uuid, autogenerated: true}
  schema "categories" do
    field :name, :string
    field :date_added, :date

    #FK for questions table
    has_many :questions, AnonRoulette.Question, foreign_key :category_key

    #FK and PK for many-to-many categories_roulette table
    many_to_many :session, AnonRoulette.RouletteSession, joint_through: "categories_roulette"
    #timestamps()
  end


end
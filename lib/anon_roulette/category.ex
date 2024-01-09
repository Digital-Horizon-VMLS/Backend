defmodule AnonRoulette.Category do
  use Ecto.Schema
  import Ecto.Changeset
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

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  @date_regex ~r/^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :date_added])
    |> validate_required([:name, :date_added])
    |> validate_format(:date_added, @date_regex)
    |> unique_constraint(:name)
  end
end

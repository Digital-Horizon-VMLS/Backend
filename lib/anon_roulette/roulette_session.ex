defmodule AnonRoulette.RouletteSession do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:roulette_session_id, :id, autogenerate: true}
  schema "roulette_session" do
    # FK and PK for many-to-many users_roulette table
    many_to_many :users, AnonRoulette.User,
      join_through: "users_roulette",
      join_keys: [roulette_session_id: :roulette_session_id, user_id: :user_id]

    # FK and PK for many-to-many categories_roulette table
    many_to_many :category, AnonRoulette.Category,
      join_through: "categories_roulette",
      join_keys: [roulette_session_id: :roulette_session_id, category_id: :category_id]

    # FK for events table
    has_many :events, AnonRoulette.Event,
      foreign_key: :roulette_session_id,
      references: :roulette_session_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
end

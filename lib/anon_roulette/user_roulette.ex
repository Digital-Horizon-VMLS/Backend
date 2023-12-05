defmodule AnonRoulette.UserRoulette do
  use Ecto.Schema

  # This defines the database table for the schema
  schema "users_roulette" do
    belongs_to :user, AnonRoulette.User, references: :user_id
    belongs_to :session, AnonRoulette.RouletteSession, references: :roulette_session_id

    # timestamps()
  end

  # This defines changeset functions for creating and updating data
end

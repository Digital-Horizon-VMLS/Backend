defmodule AnonRoulette.UserRoulette do
  use Ecto.Schema

  # This defines the database table for the schema
  schema "users_roulette" do
    belongs_to :user, AnonRoulette.User
    belongs_to :session, AnonRoulette.RouletteSession

    # timestamps()
  end

  # This defines changeset functions for creating and updating data
end

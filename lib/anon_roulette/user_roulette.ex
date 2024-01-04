defmodule AnonRoulette.UserRoulette do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  schema "user_roulette" do
    belongs_to :user, AnonRoulette.User, references: :user_id
    belongs_to :session, AnonRoulette.RouletteSession, references: :roulette_session_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(user_roulette, attrs) do
    user_roulette
    |> cast(attrs, [:user_id, :roulette_session_id])
    |> validate_required([:user_id, :roulette_session_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:roulette_session_id)
  end
end

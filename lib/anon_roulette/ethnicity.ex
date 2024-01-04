defmodule AnonRoulette.Ethnicity do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  @primary_key {:ethnic_id, :id, autogenerate: true}
  schema "ethnicity" do
    field :ethnic_name, :string
    has_many :users, AnonRoulette.User, foreign_key: :ethnic_id
    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(ethnicity, attrs) do
    ethnicity
    |> cast(attrs, [:ethnic_name])
    |> validate_required([:ethnic_name])
    |> unique_constraint(:ethnic_name)
  end
end

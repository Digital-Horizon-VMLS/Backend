defmodule AnonRoulette.User do
  use Ecto.Schema

  # This defines the database table for the schema
  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :age, :email])
    |> validate_required([:name, :age, :email])
    |> validate_format(:email, ~r/@/)
  end
end

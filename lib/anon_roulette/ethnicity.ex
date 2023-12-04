defmodule AnonRoulette.Ethnicities do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:ethnic_id, :uuid, autogenerated: true}
  schema "ethnicities" do
    field :ethnic_name, :string
    has_many :users, AnonRoulette.User, foreign_key :ethnic_id
    #timestamps()
  end


end
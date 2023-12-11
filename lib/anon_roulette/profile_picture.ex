defmodule AnonRoulette.ProfilePicture do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:profile_picture_id, :id, autogenerate: true}
  schema "profile_picture" do
    field :profile_picture_url, :string

    has_many :users, AnonRoulette.User, foreign_key: :profile_picture_id

    ## timestamps()
  end

  # This defines changeset functions for creating and updating data
end

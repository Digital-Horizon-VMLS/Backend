defmodule AnonRoulette.ProfilePicture do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  @primary_key {:profile_picture_id, :id, autogenerate: true}
  schema "profile_picture" do
    field :profile_picture_url, :string

    has_many :users, AnonRoulette.User, foreign_key: :profile_picture_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  def changeset(profile_picture, attrs) do
    profile_picture
    |> cast(attrs, [:profile_picture_url])
    |> validate_required([:profile_picture_url])

    # |> validate_format(:email, ~r/@/)
  end
end

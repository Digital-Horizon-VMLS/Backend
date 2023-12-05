defmodule AnonRoulette.Repo.Migrations.Create_ProfilePictures do
  use Ecto.Migration

  def change do
    create table(:profile_pictures, primary_key: false) do
      add :profile_picture_id, :id, primary_key: true
      add :profile_picture_url, :string
    end
  end
end

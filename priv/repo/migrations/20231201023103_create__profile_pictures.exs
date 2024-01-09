defmodule AnonRoulette.Repo.Migrations.Create_ProfilePictures do
  use Ecto.Migration

  def change do
    create table(:profile_picture, primary_key: false) do
      add :profile_picture_id, :bigserial, primary_key: true
      add :profile_picture_url, :string
      timestamps()
    end
  end
end

defmodule AnonRoulette.Repo.Migrations.Create_Users do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :uuid, primary_key: true
      add :first_name, :string
      add :last_namem, :string
      add :birth_date, :date
      add :ethnic_id, references("ethnicities", on_delete: :nothing, type: :integer)
      add :profile_description, :string
      add :profile_picture_id, references("profile_pictures", on_delete: :nothing, type: :integer)

    end
  end
end

defmodule AnonRoulette.Repo.Migrations.Create_Users do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :birth_date, :date

      add :ethnic_id,
          references("ethnicities", column: :ethnic_id, on_delete: :nothing, type: :id)

      add :profile_description, :string

      add :profile_picture_id,
          references("profile_pictures",
            column: :profile_picture_id,
            on_delete: :nothing,
            type: :id
          )
    end
  end
end

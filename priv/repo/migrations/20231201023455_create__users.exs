defmodule AnonRoulette.Repo.Migrations.Create_Users do
  use Ecto.Migration

  def change do
    create table(:user, primary_key: false) do
      add :user_id, :bigserial, primary_key: true
      add :username, :string, null: false
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :birth_date, :date
      add :profile_description, :string
      add :is_active, :boolean, default: true, null: false

      add :ethnic_id,
          references("ethnicity", column: :ethnic_id, on_delete: :nilify_all)

      add :profile_picture_id,
          references("profile_picture",
            column: :profile_picture_id,
            on_delete: :nilify_all
          )

      timestamps()
    end

    create unique_index(:user, [:username])
    create unique_index(:user, [:email])
  end
end

defmodule AnonRoulette.Repo.Migrations.CreateEthnicities do
  use Ecto.Migration

  def change do
    create table(:ethnicity, primary_key: false) do
      add :ethnic_id, :bigserial, primary_key: true
      add :ethnic_name, :string

      timestamps()
    end

    create unique_index(:ethnicity, [:ethnic_name])
  end
end

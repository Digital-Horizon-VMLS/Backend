defmodule AnonRoulette.Repo.Migrations.CreateEthnicities do
  use Ecto.Migration

  def change do
    create table(:ethnicity, primary_key: false) do
      add :ethnic_id, :id, primary_key: true
      add :ethnic_name, :string

      # timestamps()
    end
  end
end

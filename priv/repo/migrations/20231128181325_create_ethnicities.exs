defmodule AnonRoulette.Repo.Migrations.CreateEthnicities do
  use Ecto.Migration

  def change do
    create table(:ethnicities, primary_key: false) do
      add :ethnic_id, :uuid, primary_key: true
      add :ethnic_name, :string

      #timestamps()
    end
  end
end
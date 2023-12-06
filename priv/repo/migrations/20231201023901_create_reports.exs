defmodule AnonRoulette.Repo.Migrations.CreateReports do
  use Ecto.Migration

  def change do
    create table(:report, primary_key: false) do
      add :report_id, :id, primary_key: true
      add :sender_id, references("user", column: :user_id, on_delete: :nothing, type: :integer)
      add :offender_id, references("user", column: :user_id, on_delete: :nothing, type: :integer)
      add :reason, :string
      add :sent_date, :date
    end
  end
end

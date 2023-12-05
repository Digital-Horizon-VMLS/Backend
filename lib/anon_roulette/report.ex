defmodule AnonRoulette.Report do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:report_id, :id, autogenerate: true}
  schema "reports" do
    field :reason, :string
    field :sent_date, :date

    # FK from users table
    belongs_to :sender_user, AnonRoulette.User, foreign_key: :sender_id, references: :user_id
    belongs_to :offender_user, AnonRoulette.User, foreign_key: :offender_id, references: :user_id

    # timestamps()
  end
end

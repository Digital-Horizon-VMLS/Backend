defmodule AnonRoulette.Report do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  @primary_key {:report_id, :id, autogenerate: true}
  schema "report" do
    field :reason, :string
    field :sent_date, :date

    # FK from users table
    belongs_to :sender_user, AnonRoulette.User, foreign_key: :sender_id, references: :user_id
    belongs_to :offender_user, AnonRoulette.User, foreign_key: :offender_id, references: :user_id

    timestamps()
  end

  # This defines changeset functions for creating and updating data
  @date_regex ~r/^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/
  def changeset(report, attrs) do
    report
    |> cast(attrs, [:reason, :sent_date, :sender_id, :offender_id])
    |> validate_required([:reason, :sent_date, :sender_id, :offender_id])
    |> validate_format(:sent_date, @date_regex)
    |> foreign_key_constraint(:sender_id)
    |> foreign_key_constraint(:offender_id)
  end
end

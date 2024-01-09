defmodule AnonRoulette.PrivateMessage do
  use Ecto.Schema
  import Ecto.Changeset
  # This defines the database table for the schema
  @primary_key {:message_id, :id, autogenerate: true}
  schema "private_message" do
    field :text_message, :string
    field :sent_date, :string

    # FK from users table
    belongs_to :from_user, AnonRoulette.User, foreign_key: :from_user_id, references: :user_id
    belongs_to :to_user, AnonRoulette.User, foreign_key: :to_user_id, references: :user_id
    timestamps()
  end

  # This defines changeset functions for creating and updating data
  @date_regex ~r/^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/
  def changeset(private_message, attrs) do
    private_message
    |> cast(attrs, [:text_message, :sent_date, :from_user_id, :to_user_id])
    |> validate_required([:text_message, :sent_date, :from_user_id, :to_user_id])
    |> validate_format(:email, @date_regex)
    |> foreign_key_constraint(:from_user_id)
    |> foreign_key_constraint(:to_user_id)
  end
end

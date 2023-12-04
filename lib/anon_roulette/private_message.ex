defmodule AnonRoulette.PrivateMessage do
  use Ecto.Schema

  # This defines the database table for the schema
  @primary_key {:message_id, :uuid, autogenerated: true}
  schema "private_messages" do
    field :text_message, :string
    field :sent_date, :string

    #FK from users table
    belongs_to :from_user, AnonRoulette.User, foreign_key :from_user
    belongs_to :to_user, AnonRoulette.User, foreign_key :to_user


  end

end
defmodule AnonRoulette.Token do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_id, :id, autogenerate: true}
  schema "token" do
    field :token, :string, redact: true
    field :user_agent, :string, redact: true

    # FK from user table
    belongs_to :user, AnonRoulette.User, references: :user_id

    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [
      :user_id,
      :token,
      :user_agent
    ])
    |> validate_required([:user_id, :token])
    |> unique_constraint(:token)
    |> foreign_key_constraint(:user_id)
  end
end

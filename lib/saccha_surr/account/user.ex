defmodule SacchaSurr.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :book_weight, :integer
    field :city, :string
    field :country, :string
    field :email, :string
    field :phone_number, :integer
    field :quantity, :integer
    field :shipping_address, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :name,
      :email,
      :phone_number,
      :book_weight,
      :quantity,
      :country,
      :shipping_address,
      :city,
      :state
    ])
    |> validate_required([
      :name,
      :email,
      :phone_number,
      :book_weight,
      :quantity,
      :country,
      :shipping_address,
      :city,
      :state
    ])
  end
end

defmodule SacchaSurr.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :phone_number, :integer
      add :book_weight, :integer
      add :quantity, :string
      add :country, :string
      add :shipping_address, :string
      add :city, :string
      add :state, :string

      timestamps()
    end
  end
end

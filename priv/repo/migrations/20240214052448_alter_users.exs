defmodule SacchaSurr.Repo.Migrations.AlterUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :book_price, :integer
    end
  end
end

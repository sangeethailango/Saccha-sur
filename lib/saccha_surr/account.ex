defmodule SacchaSurr.Account do

  alias SacchaSurr.Account.User

  def user_changeset(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def calculate_book_amount(quantity) when is_nil(quantity) == false do
    quantity = String.to_integer(quantity)
    quantity * 500
  end
end

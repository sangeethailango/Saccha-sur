defmodule SuchaaSurrWeb.PageController do
  use SuchaaSurrWeb, :controller

  def home(conn, params) do
    render(conn, :home, layout: false, order_id: params["order_id"], amount: params["amount"] )
  end

  def successful_payment(conn, _params)do
    IO.inspect(conn, label: "Conn")
    conn
    |> redirect(to:  "/")
  end
end

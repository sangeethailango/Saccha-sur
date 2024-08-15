defmodule SuchaaSurrWeb.TellmeastoryLive.FormComponent do
  use SuchaaSurrWeb, :live_component

  alias SacchaSurr.Account

  @key_id "rzp_test_270oaMCzf0ozoH"
  @key_secret "GdrW76lQF3AsdpvLicb26JTm"

  def render(assigns) do
    ~H"""
    <main>
      <p class="text-center text-[#F97316] font-bold">Order Details</p>
      <.simple_form for={@form} phx-target={@myself} phx-change="validate" phx-submit="pay">
        <section class="flex flex-row justify-between">
          <section>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Name
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:name]} type="text" />
              </div>
            </div>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Phone Number
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:phone_number]} type="text" />
              </div>
            </div>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Email
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:email]} type="email" />
              </div>
            </div>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Shipping Address
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:shipping_address]} type="text" />
              </div>
            </div>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                State
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:state]} type="text" />
              </div>
            </div>
          </section>
          <section>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                city
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:city]} type="text" />
              </div>
            </div>
            <div>
              <label for="closed from" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Country
              </label>
              <div class="col-span-2 sm:mt-0">
                <.input field={@form[:country]} type="text" />
              </div>
            </div>
            <div>
              <label for="number-input" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Book Count:
              </label>
              <.input
                field={@form[:quantity]}
                type="number"
                id="number-input"
                min="1"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 "
                placeholder="0"
              />
            </div>
            <div>
              <label for="auto-fill" class="block text-sm font-medium leading-6 text-gray-900 pt-4">
                Book Price:
              </label>
              <.input
                field={@form[:book_price]}
                value={@book_amount}
                id="auto-fill"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 "
                placeholder="0"
              />
            </div>
          </section>
        </section>
        <div class="flex flex-row justify-between pt-10 ">
          <span>Total Amount </span>
          <.button value="submit">Pay ₹<%= @book_amount %></.button>
        </div>
      </.simple_form>
    </main>
    """
  end

  def update(%{user: user} = assigns, socket) do
    changeset = Account.user_changeset(user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(order_id: "")
     |> assign(book_amount: "500")
     |> assign_form(changeset)}
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    IO.inspect(user_params, label: "User params")
    book_amount = Account.calculate_book_amount(user_params["quantity"])

    {:noreply,
     socket
     |> assign(book_amount: book_amount)}
  end

  def handle_event("pay", %{"user" => user_params}, socket) do
    book_amount = Account.calculate_book_amount(user_params["quantity"])

    body =
      %{
        amount: book_amount * 100,
        currency: "INR",
        receipt: "qwsaq1",
        partial_payment: true,
        first_payment_min_amount: 230
      }

    headers = [
      {"content-type", "application/json"},
      {"Authorization", "Basic #{Base.encode64("#{@key_id}:#{@key_secret}") |> String.trim()}"}
    ]

    {:ok, response} =
      HTTPoison.post(
        "https://api.razorpay.com/v1/orders",
        Poison.encode!(body),
        headers
      )

    {:ok, decoded_body} = Poison.decode(response.body)

    {:noreply,
     socket
     |> push_navigate(to: ~p"/pay?order_id=#{decoded_body["id"]}&amount=#{book_amount}")}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end

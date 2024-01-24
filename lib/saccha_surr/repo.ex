defmodule SacchaSurr.Repo do
  use Ecto.Repo,
    otp_app: :saccha_surr,
    adapter: Ecto.Adapters.Postgres
end

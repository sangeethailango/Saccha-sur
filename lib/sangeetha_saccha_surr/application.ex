defmodule SangeethaSacchaSurr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SangeethaSacchaSurrWeb.Telemetry,
      # Start the Ecto repository
      SangeethaSacchaSurr.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SangeethaSacchaSurr.PubSub},
      # Start Finch
      {Finch, name: SangeethaSacchaSurr.Finch},
      # Start the Endpoint (http/https)
      SangeethaSacchaSurrWeb.Endpoint
      # Start a worker by calling: SangeethaSacchaSurr.Worker.start_link(arg)
      # {SangeethaSacchaSurr.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SangeethaSacchaSurr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SangeethaSacchaSurrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

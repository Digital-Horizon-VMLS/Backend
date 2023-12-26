defmodule AnonRoulette.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AnonRouletteWeb.Telemetry,
      AnonRoulette.Repo,
      {DNSCluster, query: Application.get_env(:anon_roulette, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AnonRoulette.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AnonRoulette.Finch},
      # Start a worker by calling: AnonRoulette.Worker.start_link(arg)
      # {AnonRoulette.Worker, arg},
      AnonRouletteWeb.Presence,
      AnonRoulette.Scheduler,
      # Start to serve requests, typically the last entry
      AnonRouletteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AnonRoulette.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AnonRouletteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

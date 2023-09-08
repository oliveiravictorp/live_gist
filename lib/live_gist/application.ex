defmodule LiveGist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveGistWeb.Telemetry,
      # Start the Ecto repository
      LiveGist.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveGist.PubSub},
      # Start Finch
      {Finch, name: LiveGist.Finch},
      # Start the Endpoint (http/https)
      LiveGistWeb.Endpoint
      # Start a worker by calling: LiveGist.Worker.start_link(arg)
      # {LiveGist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveGist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveGistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

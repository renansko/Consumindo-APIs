# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :repositorios_get,
  ecto_repos: [RepositoriosGet.Repo]

# Configures the endpoint
config :repositorios_get, RepositoriosGetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yiMrDf1L2iGHBuP/fCiE/oIr+PZ2EqPcCSTrBT8XiUIN3wZX95SsXqQWMQAcjTfS",
  render_errors: [view: RepositoriosGetWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RepositoriosGet.PubSub,
  live_view: [signing_salt: "nWj6n57o"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :repositorios_get, RepositoriosGetWeb.Auth.Guardian,
  issuer: "repositorios_get",
  secret_key: "mix guardian.gen.secret"

config :repositorios_get, RepositoriosGetWeb.Auth.Pipeline,
  module: RepositoriosGetWeb.Auth.Guardian,
  error_handler: RepositoriosGetWeb.Auth.ErrorHandler

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

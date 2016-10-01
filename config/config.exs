# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :battle_tracker,
  ecto_repos: [BattleTracker.Repo]

# Configures the endpoint
config :battle_tracker, BattleTracker.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XWr7T3WUFE6d9n7QmKpLT6syEeuYEPWD9TzJoB85qmHJnxwD1F9NU42N2m3lqJMG",
  render_errors: [view: BattleTracker.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BattleTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

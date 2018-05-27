# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :brainfuck_server,
  ecto_repos: [BrainfuckServer.Repo]

# Configures the endpoint
config :brainfuck_server, BrainfuckServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "slXfZMvKe0RWhCGGe8pePI+SC9fdmkFq78mInerp5r2i6odHY1EDe/XkYFlHawE8",
  render_errors: [view: BrainfuckServerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BrainfuckServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

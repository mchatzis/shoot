import Config

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
config :backend, BackendWeb.Endpoint,
  url: [scheme: "https", host: "aram.gigalixirapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]]

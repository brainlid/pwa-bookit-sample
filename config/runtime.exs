import Config

if config_env() == :prod do
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  app_domain = System.fetch_env!("APP_DOMAIN")

  config :phoenix_example, PhoenixExampleWeb.Endpoint,
    url: [host: app_domain, port: 443],
    http: [
      port: String.to_integer(System.get_env("PORT") || "8080"),
      transport_options: [socket_opts: [:inet6]]
    ],
    secret_key_base: secret_key_base
end

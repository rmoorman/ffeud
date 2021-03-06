use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :family_feud, FamilyFeud.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :family_feud, FamilyFeud.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "efatsi",
  password: "",
  database: "family_feud_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Ease up on the password hashing algorithm
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1

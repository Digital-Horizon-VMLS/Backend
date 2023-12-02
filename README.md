# Introduction
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project.

# Getting Started
To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Setting up MySQL Database
The server requires a correct database configuration to start. The configuration for
development can be found at `/config/dev.exs`.

### Example Database Config
``` elixir
config :anon_roulette, AnonRoulette.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "anon_roulette_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

## Setting up Guardian
The server requires a secret key for guardian configuration. The command `mix guardian.gen.secret` can be used to
to generate a secret. This secret should be added to the guardian configuration located at `/config/config.exs`.
Avoid commiting the secret key to the repository or any branches.

### Example Guardian Config
``` elixir
config :anon_roulette, AnonRouletteWeb.Guardian,
  issuer: "anon_roulette",
  secret_key: "iamasecret"
```

# Build and Test
TODO: Describe and show how to build your code and run the tests.

# Contribute
TODO: Explain how other users and developers can contribute to make your code better.

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)

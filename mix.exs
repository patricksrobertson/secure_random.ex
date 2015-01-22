defmodule SecureRandom.Mixfile do
  use Mix.Project

  def project do
    [app: :secure_random,
     version: "0.1.1",
     elixir: "~> 1.0",
     deps: deps,
     description: "A convienance library based on Ruy's SecureRandom",
     licesences: "Apache 2.0",
     contributors: "Patrick Robertson",
     name: "SecureRandom.ex",
     source_url: "https://github.com/patricksrobertson/secure_random.ex",
     homepage_url: "https://github.com/patricksrobertson/secure_random.ex"
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  def deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.6", only: :dev}]
  end
end

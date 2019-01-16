defmodule SecureRandom.Mixfile do
  use Mix.Project

  def project do
    [
      app: :secure_random,
      version: "0.5.2",
      elixir: ">= 1.6.6",
      deps: deps(),
      description: "A convienance library based on Ruby's SecureRandom",
      package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :crypto]]
  end

  defp package do
    [
      maintainers: ["Patrick Robertson"],
      licenses: ["Apache 2.0"],
      links: %{github: "https://github.com/patricksrobertson/secure_random.ex"}
    ]
  end

  def deps do
    [
      {:earmark, "~> 1.3.1", only: :dev},
      {:ex_doc, "~> 0.19.2", only: :dev}
    ]
  end
end

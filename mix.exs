defmodule Mixpanel.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :mixpanel_client,
      version: @version,
      elixir: "~> 1.12",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: description(),
      package: package(),

      # Docs
      name: "Mixpanel Client",
      docs: [
        extras: ["README.md", "CHANGELOG.md"],
        source_ref: "v#{@version}",
        main: "Mixpanel",
        source_url: "https://github.com/logicmason/mixpanel_client"
      ]
    ]
  end

  def description do
    "Elixir client for the Mixpanel API."
  end

  def package do
    [
      maintainers: ["Mark Wilbur"],
      licenses: ["The MIT License"],
      links: %{"GitHub" => "https://github.com/logicmason/mixpanel_client"},
      files: ~w(mix.exs README.md CHANGELOG.md lib)
    ]
  end

  def application do
    [mod: {Mixpanel, []}, applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.0"},
      {:mock, "~> 0.3.7", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, "~> 1.0", only: :dev},
      {:inch_ex, ">= 0.0.0", only: :dev}
    ]
  end
end

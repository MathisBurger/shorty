defmodule Shorty.MixProject do

  use Mix.Project

  def project do
    [
      app: :shorty,
      version: "1.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Shorty.Application, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:cors_plug, "~> 2.0"},
      {:jason, "~> 1.2"},
      {:dotenvy, "~> 0.1.0"},
    ]
  end
end

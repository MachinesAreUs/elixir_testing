defmodule ElixirTestingOverview.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_testing,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test],
     deps: deps]
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
  defp deps do
    [
     {:eqc_ex, git: "https://github.com/Quviq/eqc_ex.git", tag: "1.2.4"},
     {:excheck, "~> 0.5", only: :test},
     {:triq, github: "triqng/triq", only: :test},
     {:excoveralls, "~> 0.4", only: :test},
     {:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end

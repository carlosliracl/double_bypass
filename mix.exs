defmodule DoubleBypass.Mixfile do
  use Mix.Project

  def project do
    [app: :double_bypass,
     version: "0.0.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
     description: description(),
     test_coverage: [tool: ExCoveralls]]
  end

  def application do
    [applications: [:bypass, :logger]]
  end

  defp deps do
    [
      {:bypass, "~> 0.5"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:excoveralls, "~> 0.6", only: :test},
      {:httpoison, "~> 0.11.1", only: :test},
      {:poison, "~> 2.2 or ~> 3.0"}
    ]
  end

  defp description do
    """
    A wrapper around Bypass. Double Bypass makes configuring and initializing Bypass easy.
    It also removes redundant test assertion code, and ecourages testing external requests in
    a self documenting manner.
    """
  end

  defp package do
    [
      name: :double_bypass,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Michael Smykowski"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/msmykowski/double_bypass"}
    ]
  end
end

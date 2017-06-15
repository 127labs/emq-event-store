defmodule EmqEventStore.Mixfile do
  use Mix.Project

  def project do
    [
      app: :emq_event_store,
      version: "2.2.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EmqEventStore.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:poison, "~> 3.1"},
     {:postgrex, ">= 0.0.0"},
     {:ecto, "~> 2.1"},
     {:distillery, "~> 1.4"}]
  end
end

defmodule TextClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :text_client,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  # Add included_applications config so that Hangman is loaded in text_client context
  # but it doesn't start a process. Usually though this will be handled at Phoenix framework level
  def application do
    [
      included_applications: [:hangman],
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:hangman, path: "../hangman"}
    ]
  end
end

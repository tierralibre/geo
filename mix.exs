Code.ensure_loaded?(Hex) and Hex.start

defmodule Geo.Mixfile do
  use Mix.Project

  def project do
    [ app: :geo,
      version: "0.9.3",
      elixir: "~> 1.0.0",
      deps: deps,
      description: description,
      package: package,
      source_url: "https://github.com/bryanjos/geo"    ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:jazz]
    ]
  end

  defp description do
    """
    A collection of encoders and decoders for WKB, WKT, and GeoJSON and PostGIS data type support for Postgrex.
    """
  end

  defp deps do
    [ 
      {:jazz, "~> 0.2.1"},
      {:postgrex, "~> 0.6.0", optional: true },
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.6", only: :dev}
    ]
  end

  defp package do
    [ # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      contributors: ["Bryan Joseph"],
      licenses: ["MIT"],
      links: %{ "GitHub" => "https://github.com/bryanjos/geo" }
    ]
  end
end

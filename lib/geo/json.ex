defmodule Geo.JSON do
  alias Geo.JSON.{Decoder, Encoder}

  @moduledoc """
  Converts Geo structs to and from a map representing GeoJSON.


  You are responsible to encoding and decoding of JSON. This is so
  that you can use any JSON parser you want as well as making it
  so that you can use the resulting GeoJSON structure as a property
  in larger JSON structures.

  ```
  # Using Jason as the JSON parser for these examples

  iex>json = "{ \\"type\\": \\"Point\\", \\"coordinates\\": [100.0, 0.0] }"
  ...>json |> Jason.decode!() |> Geo.JSON.decode!()
  %Geo.Point{coordinates: {100.0, 0.0}, srid: nil}

  iex>geom = %Geo.Point{coordinates: {100.0, 0.0}, srid: nil}
  ...>Jason.encode!(geom)
  "{\\"coordinates\\":[100.0,0.0],\\"type\\":\\"Point\\"}"

  iex>geom = %Geo.Point{coordinates: {100.0, 0.0}, srid: nil}
  ...>Geo.JSON.encode!(geom)
  %{"type" => "Point", "coordinates" => [100.0, 0.0]}
  ```
  """

  @doc """
  Takes a map representing GeoJSON and returns a Geometry
  """
  @spec decode!(map()) :: Geo.geometry() | no_return
  defdelegate decode!(geo_json), to: Decoder

  @doc """
  Takes a map representing GeoJSON and returns a Geometry
  """
  @spec decode(map()) :: {:ok, Geo.geometry()} | {:error, Decoder.DecodeError.t()}
  defdelegate decode(geo_json), to: Decoder

  @doc """
  Takes a Geometry and returns a map representing the GeoJSON
  """
  @spec encode!(Geo.geometry()) :: map() | no_return
  defdelegate encode!(geom), to: Encoder
  defdelegate encode!(geom, opts), to: Encoder

  @doc """
  Takes a Geometry and returns a map representing the GeoJSON
  """
  @spec encode(Geo.geometry()) :: {:ok, map()} | {:error, Encoder.EncodeError.t()}
  defdelegate encode(geom), to: Encoder
  defdelegate encode(geom, opts), to: Encoder
end

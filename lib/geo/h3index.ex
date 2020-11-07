defmodule Geo.H3Index do
  @moduledoc """
  Defines the H3Index struct.
  """

  #@type latitude :: number
  #@type longitude :: number

  #@type t :: %Geo.H3Index{coordinates: {longitude, latitude}, srid: integer | nil, properties: map}
  defstruct h3index: nil
end

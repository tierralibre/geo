defmodule Geo.MultiLineString do
  @moduledoc """
  Defines the MultiLineString struct.
  """

  @type t :: %Geo.MultiLineString{coordinates: [[{number, number}]], srid: integer}
  defstruct coordinates: [], srid: nil
end

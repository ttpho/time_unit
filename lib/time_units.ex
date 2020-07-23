defmodule TimeUnits do
  @callback to_milli_seconds(t :: number()) :: number()

  def to_milli_seconds(t, unit) do
    unit
    |> get_mapper()
    |> apply(:to_milli_seconds, [t])
  end

  def conver(t, unit_from, unit_to),
    do: to_milli_seconds(t, unit_from) / to_milli_seconds(1, unit_to)

  defp get_mapper(:seconds), do: Second
  defp get_mapper(:minutes), do: Minute
  defp get_mapper(:hours), do: Hour
  defp get_mapper(:days), do: Day
  defp get_mapper(_), do: Unknow
end

defmodule Unknow do
  @behaviour TimeUnits

  @impl TimeUnits
  def to_milli_seconds(t), do: t
end

defmodule Second do
  @behaviour TimeUnits

  @impl TimeUnits
  def to_milli_seconds(t), do: 1000 * t
end

defmodule Minute do
  @behaviour TimeUnits

  @impl TimeUnits
  def to_milli_seconds(t), do: 1000 * 60 * t
end

defmodule Hour do
  @behaviour TimeUnits

  @impl TimeUnits
  def to_milli_seconds(t), do: 1000 * 60 * 60 * t
end

defmodule Day do
  @behaviour TimeUnits

  @impl TimeUnits
  def to_milli_seconds(t), do: 1000 * 60 * 60 * 24 * t
end

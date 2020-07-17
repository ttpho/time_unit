defmodule TimeUnit do
  @c_milliseconds 1
  @c_seconds 1000
  @c_minutes 1000 * 60
  @c_hours 1000 * 60 * 60
  @c_days 1000 * 60 * 60 * 24

  @supported_unit "supported units: :millisecond, :second, :minute, :hour, :day"

  @time_unit_map %{
    millisecond: @c_milliseconds,
    second: @c_seconds,
    minute: @c_minutes,
    hour: @c_hours,
    day: @c_days
  }

  @moduledoc """
  Documentation for `TimeUnit`.
  """

  @doc """
  Conver d unit to milliseconds
  ## Examples

      iex> TimeUnit.to_millis(24, :hour)
      {:ok, 86400000}

  """
  def to_millis(d, unit) do
    case Map.fetch(@time_unit_map, unit) do
      {:ok, value} -> {:ok, value * d}
      :error -> {:error, "the unit #{unit} is not supported " <> @supported_unit}
    end
  end

  def conver(value, from, to) do
    case to_millis(value, from) do
      {:ok, v_from} ->
        case to_millis(value, to) do
          {:ok, v_to} -> {:ok, v_from / v_to}
          _ -> {:error, "the unit #{to} is not supported " <> @supported_unit}
        end

      _ ->
        {:error, "the unit #{from} is not supported " <> @supported_unit}
    end
  end
end

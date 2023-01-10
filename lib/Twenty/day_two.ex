defmodule Aoc.Twenty.DayTwo do
  alias Aoc.Twenty.Inputs
  @input Inputs.day_two()

  def solve_part_one do
    @input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [range, letter, pass] ->
      [start, finish] = parse_range(range)

      [letter] = String.split(letter, ":", trim: true)

      pass
      |> get_total_appearances_on_password(letter)
      |> is_correct_password?(start, finish)
    end)
    |> Enum.count(fn result -> result == true end)
  end

  defp parse_range(range) do
    range
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
  end

  defp get_total_appearances_on_password(pass, letter) do
    pass
    |> String.split("", trim: true)
    |> Enum.count(fn l -> l == letter end)
  end

  defp is_correct_password?(total, start, finish), do: total in start..finish
end

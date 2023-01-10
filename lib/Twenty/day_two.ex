defmodule Aoc.Twenty.DayTwo do
  alias Aoc.Twenty.Inputs
  @input Inputs.day_two()

  def solve_part_one do
    parse_input()
    |> Enum.map(&do_solve_part_one/1)
    |> count()
  end

  def solve_part_two do
    parse_input()
    |> Enum.map(&do_solve_part_two/1)
    |> count()
  end

  defp do_solve_part_one([range, letter, pass]) do
    [start, finish] = parse_range(range)
    [letter] = String.split(letter, ":", trim: true)

    pass
    |> get_total_appearances_on_password(letter)
    |> is_correct_password?(start, finish)
  end

  defp do_solve_part_two([range, letter, password]) do
    [start, finish] = parse_range(range)

    [letter] = String.split(letter, ":", trim: true)

    letter_meet_password_correct_position?(password, letter, start, finish)
  end

  defp letter_meet_password_correct_position?(password, letter, start, finish) do
    first = String.at(password, start - 1) == letter
    last = String.at(password, finish - 1) == letter

    case [first, last] do
      [false, false] -> false
      [true, true] -> false
      _ -> true
    end
  end

  defp count(result), do: Enum.count(result, fn res -> res == true end)

  defp parse_input() do
    @input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " "))
  end

  defp parse_range(range) do
    range
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
  end

  defp get_total_appearances_on_password(pass, letter) do
    pass
    |> String.split("", trim: true)
    |> Enum.count(&(&1 == letter))
  end

  defp is_correct_password?(total, start, finish), do: total in start..finish
end

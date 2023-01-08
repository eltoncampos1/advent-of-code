defmodule Aoc.Twenty.DayOne do
  alias Aoc.Twenty.Inputs
  @input Inputs.day_one()

  def solve_part_one do
    numbers = parse_input()

    Enum.reduce(numbers, 0, fn number, acc ->
      if acc == 0 do
        number * Enum.find(numbers, 0, &(&1 + number == 2020))
      else
        acc
      end
    end)
  end

  def solve_part_two do
    numbers = parse_input()
    [_head | nubs2] = numbers
    [_head | nubs3] = nubs2

    for n1 <- numbers, n2 <- nubs2, n3 <- nubs3, n1 + n2 + n3 == 2020 do
      n1 * n2 * n3
    end
    |> hd
  end

  defp parse_input do
    @input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer(&1))
  end
end

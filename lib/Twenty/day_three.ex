defmodule Aoc.Twenty.DayThree do
  alias Aoc.Twenty.Inputs
  @input Inputs.day_three()
  def solve_part_one do
    [_head | fields] =
      @input
      |> String.split("\n", trim: true)
      |> Enum.with_index()

    fields
    |> Enum.map(fn {row, index} ->
      if index * 3 > String.length(row) do
        String.at(row, rem(index * 3, String.length(row)))
      else
        String.at(row, index * 3)
      end
    end)
    |> Enum.filter(& &1)
    |> Enum.count(&(&1 == "#"))
  end
end

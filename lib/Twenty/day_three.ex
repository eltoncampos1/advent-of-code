defmodule Aoc.Twenty.DayThree do
  alias Aoc.Twenty.Inputs
  @input Inputs.day_three()
  def solve_part_one do
    [_head | fields] =
      @input
      |> String.split("\n", trim: true)
      |> Enum.with_index()

    fields
    |> Enum.map(&find_trees(&1, 3))
    |> Enum.count(&(&1 == "#"))
  end

  defp find_trees({row, index}, value) do
    if index * value > String.length(row) do
      String.at(row, rem(index * value, String.length(row)))
    else
      String.at(row, index * value)
    end
  end
end

defmodule RomansTest do
  use ExUnit.Case

  test "single-digit numbers" do
    examples = [
      [1, "I"],
      [2, "II"],
      [3, "III"],
      [4, "IV"],
      [5, "V"],
      [6, "VI"],
      [7, "VII"],
      [8, "VIII"],
      [9, "IX"],
      [10, "X"],
    ]

    Enum.map(examples, fn([arabic, roman]) ->
        assert Romans.from_arabic(arabic) == roman
      end)
  end

  test "decompression" do
    examples = [
      [1,    [0, 0, 0, 1]],
      [12,   [0, 0, 1, 2]],
      [123,  [0, 1, 2, 3]],
      [1234, [1, 2, 3, 4]],
    ]

    Enum.map(examples, fn([origin, result]) ->
        assert Romans.decompress(origin) == result
      end)
  end
end

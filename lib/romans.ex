defmodule Romans do
  def from_arabic(arabic) do
    [thousands, hundreds, tens, ones] = decompress(arabic)

    process_tens(tens) ++ process_ones(ones) |> List.to_string
  end

  def decompress(number) do
    [
      rem(div(number, 1000), 10),
      rem(div(number, 100), 10),
      rem(div(number, 10), 10),
      rem(number, 10)
    ]
  end

  defp process_tens(arabic) do
    'X' |> List.duplicate(arabic) |> List.flatten |> compact_tens
  end

  defp process_ones(arabic) do
    'I' |> List.duplicate(arabic) |> List.flatten |> compact_ones 
  end




  ########################################################

  defp compact_tens(whatever) do
    whatever
  end

  ########################################################
  defp compact_ones([73, 73, 73, 73, 73, 73, 73, 73, 73| tail]) do
    'IX' ++ tail
  end

  defp compact_ones([73, 73, 73, 73, 73| tail]) do
    'V' ++ tail
  end

  defp compact_ones([73, 73, 73, 73| tail]) do
    'IV' ++ tail
  end

  defp compact_ones(whatever) do
    whatever
  end
end

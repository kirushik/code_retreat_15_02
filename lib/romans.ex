defmodule Compaction do
  defmacro compaction(order, _char, _n, _replacement) do
    function_name = "compact_#{order}" |> String.to_atom
    quote do
      defp unquote(function_name)(whatever) do
        whatever
      end
    end
  end
end

defmodule Romans do  
  import Compaction

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

  compaction :tens, ?X, 5, 'L'
  # defp compact_tens(whatever) do
  #   whatever
  # end

  ########################################################
  defp compact_ones([?I, ?I, ?I, ?I, ?I, ?I, ?I, ?I, ?I| tail]) do
    'IX' ++ tail
  end

  defp compact_ones([?I, ?I, ?I, ?I, ?I| tail]) do
    'V' ++ tail
  end

  defp compact_ones([?I, ?I, ?I, ?I| tail]) do
    'IV' ++ tail
  end

  compaction :ones, ?I, 4, 'IV'

end

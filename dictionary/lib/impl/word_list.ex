defmodule Dictionary.Impl.WordList do
  @type t :: list(String)

  @spec word_list :: t
  def word_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  @spec random_word(t) :: String.t()
  def random_word(word_list) do
    word_list
    |> Enum.random()
  end

  def swap_tuple({a, b}), do: {b, a}
  # IO.puts("{#{b},#{a}}")
  # IO.inspect({b, a}, label: "tuple")
  # end

  # def param_match(a, b), do: a == b
  def param_match(a, a), do: true
  def param_match(_a, _b), do: false
end

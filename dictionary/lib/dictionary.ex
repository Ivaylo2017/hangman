defmodule Dictionary do
  @moduledoc """
  Documentation for `Dictionary`.
  """
  @word_list "assets/words.txt"
             |> File.read!()
             |> String.split(~r/\n/, trim: true)

  def random_word do
    @word_list
    |> Enum.random()
  end

  def swap_tuple({a, b}), do: {b, a}
  # IO.puts("{#{b},#{a}}")
  # IO.inspect({b, a}, label: "tuple")
  # end

  # def param_match(a, b), do: a == b
  def param_match(a, a), do: true
  def param_match(a, b), do: false
end

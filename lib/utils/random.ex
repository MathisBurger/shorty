defmodule Shorty.Utils.Random do


  @moduledoc """
    This module provides general functionality
    to generate random strings and other datatypes
  """

  def generateSafeString() do
    s = :crypto.strong_rand_bytes(10)
    symbols = '0123456789abcdefghijklmnopqrstuvwxyz'
    symbol_count = Enum.count(symbols)
    s = for _ <- 1..10, into: "", do: <<Enum.at(symbols, :crypto.rand_uniform(0, symbol_count))>>
    s
  end
end
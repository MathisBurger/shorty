defmodule Shorty.Utils.FileUtils do

  @moduledoc """
    This module provides some basic
    functions to read and write redirect urls to
    the data.txt file
  """

  @doc """
    This function reads all data from the file and
    parses it into tuples.
  """
  def readRedirects() do
    {ok, data} = File.read("./data.txt")
    case ok do
      :error -> {:error, []}
      :ok -> {:ok, parseRaw(data)}
    end
  end

  @doc """
    This function parses the raw data from the
    file into an list of tuples including the
    redirects
  """
  def parseRaw(data) do
    redirects = String.split(data, "\n")
    arr = for i <- redirects do
      [first, second] = String.split(i, " ")
      {first, String.replace(second, "\r", "")}
    end
    arr
  end

end
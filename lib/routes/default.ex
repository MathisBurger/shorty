defmodule Shorty.Routes.DefaultRoute do

  @doc """
    This router sends a static response,
    because it is the default API endpoint.
    It does not have a real purpose.
  """
  def response() do
    %{
      "message" => "Shorty is up and running without errors",
      "version" => "v1.0.0",
      "credentials" => "©2021 Mathis Burger"
    }
  end
end
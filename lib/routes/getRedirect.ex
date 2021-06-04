defmodule Shorty.Routes.GetRedirectRoute do

  @doc """
    This route checks, if there is
    a redirect with the given redirectString
    and either redirects the user to this webpage or
    throws an not found error
  """
  def response(id) do
    case id == "favicon.ico" do
      true -> {%{message: "favicon not supported", code: 200}, 200}
      false -> calc(id)
    end
  end

  @doc """
    I am bad at elixir lol
    This is the reason, why this function exists
  """
  def calc(id) do
    {ok, redirects} = Shorty.Utils.FileUtils.readRedirects()
    case ok do
      :error -> {%{message: "Internal server error", code: 500}, 500}
      :ok -> process(id, redirects)
    end
  end

  @doc """
    This function processes the redirect data
    and decides weather the user should be redirected to
    another website or to the notfound page of the
    shorty frontend
  """
  def process(id, redirects) do
    ids = for redirect <- redirects do
      {id, _} = redirect
      id
    end
    case Enum.member?(ids, id) do
      false -> {"https://mathis-burger.de", 301}
      true -> {accessValue(List.keyfind(redirects, id, 0)), 301}
    end
  end

  @doc """
    This function gets the url
    value from the final tuple
  """
  def accessValue(value) do
    {_, val} = value
    val
  end
end
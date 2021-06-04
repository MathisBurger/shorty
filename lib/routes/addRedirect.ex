defmodule Shorty.Routes.AddRedirectRoute do

  @doc """
    This endpoint allows to add new
    redirects to the server
  """
  def response(json_payload) do
    case json_payload["url"] do
      nil -> %{"message": "`url` parameter not given in the payload of the body", "code": 400}
      _ -> process(json_payload["url"])
    end
  end

  @doc """
    This function processes the process of adding
    the redirect to the server
  """
  def process(url) do
    {_, redirects} = Shorty.Utils.FileUtils.readRedirects()
    rand = recursiveRandomGenerator(redirects)
    Shorty.Utils.FileUtils.insertNew(rand, url)
    %{"message": "successfully added new redirect", "id": rand, "code": 200}
  end

  @doc """
    This function generates a unique id
    via recursion in the function
  """
  def recursiveRandomGenerator(redirects) do
    rand = Shorty.Utils.Random.generateSafeString()
    if List.keyfind(redirects, rand, 0) != nil do
      rand = recursiveRandomGenerator(redirects)
    end
    rand
  end
end
defmodule Shorty.Webserver.Responses do
  import Plug.Conn

  @doc """
    This function parses all data given
    as the "data" parameter into a json
    response value and returns it.
  """
  def resp_json(data, conn, status \\ 200) do
    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(status, Jason.encode!(data))
  end

  @doc """
    This function redirects the client to
    the given destination by setting the
    location header of the response
  """
  def redirect(conn, destination) do
    conn
    |> put_resp_header("Location", destination)
    |> send_resp(301, "")
  end
end
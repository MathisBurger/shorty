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
end
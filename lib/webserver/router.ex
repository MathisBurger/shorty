defmodule Shorty.Webserver.Router do
  use Plug.Router
  require Logger
  import Shorty.Webserver.Responses

  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Jason
  )

  plug :match
  plug :dispatch

  get "/api" do
    data = Shorty.Routes.DefaultRoute.response()
    data |> resp_json(conn, 200)
  end

  get "/:id" do
    {data, code} = Shorty.Routes.GetRedirectRoute.response(id)
    case code do
      301 ->  redirect(conn,  data)
      _ -> data |> resp_json(conn, 200)
    end
  end

  match _ do
    if conn.method == "OPTIONS" do
      data = %{message: "ok", code: 200}
      data |> resp_json(conn, 200)
    else
      data = %{message: "page not found", code: 404}
      data |> resp_json(conn, 404)
    end
  end
end
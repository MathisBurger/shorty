defmodule Shorty.Application do

  use Application
  require Logger

  def start(_type, _args) do

    children = [
      {
        Plug.Cowboy,
        plug: Shorty.Webserver.Router,
        scheme: :http,
        options: [
          ip: "0.0.0.0",
          port: 8080
        ]
      }
    ]

    opts = [strategy: :one_for_one, name: Shorty.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

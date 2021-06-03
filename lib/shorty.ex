defmodule Shorty.Application do

  use Application
  require Logger

  def start(_type, _args) do

    ip = Application.get_env(:shorty, Webserver)[:ip]
    port = Application.get_env(:shorty, Webserver)[:port]

    children = [
      {
        Plug.Cowboy,
        plug: Shorty.Webserver.Router,
        scheme: :http,
        options: [
          ip: Application.get_env(:shorty, Webserver)[:ip],
          port: Application.get_env(:shorty, Webserver)[:port]
        ]
      }
    ]

    Logger.info("Webserver running at addr #{ip |> Tuple.to_list() |> Enum.join(":")}:#{port}")

    opts = [strategy: :one_for_one, name: Shorty.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

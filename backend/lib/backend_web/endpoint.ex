defmodule BackendWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :backend

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_backend_key",
    signing_salt: "nG/Ctvy4",
    same_site: "Lax"
  ]

  socket "/socket", BackendWeb.UserSocket,
    websocket: [
      check_origin: [
        "https://aram.maicl.uk",
        "https://aram.gigalixirapp.com",
        "http://localhost:5173",
        "http://localhost:5174"
      ]
    ],
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug(Plug.Static,
    at: "/",
    from: :backend,
    gzip: false,
    only: BackendWeb.static_paths()
  )

  plug CORSPlug, origin: "https://aram.maicl.uk"

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(Plug.Session, @session_options)
  plug(BackendWeb.Router)
end

defmodule PlugSimple.Router do
  use Plug.Router
  require Logger

  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/example" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{test: "helo"}))
  end

  post "/post" do
    IO.inspect(conn.body_params)
    conn |> send_resp(200, Jason.encode!(%{done: true}))
  end

  match(_, do: send_resp(conn, 404, "Not here"))
end

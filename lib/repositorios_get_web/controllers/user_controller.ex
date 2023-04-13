defmodule RepositoriosGetWeb.UserController do
  use RepositoriosGetWeb, :controller
  use Phoenix.Controller
  alias RepositoriosGet.User
  alias RepositoriosGet.Error
  alias RepositoriosGetWeb.FallbackController
  # plug Plug.Parsers, parsers: [:json], pass: ["*/*"], json_decoder: Poison

  action_fallback FallbackController

  def create(conn, params) do
    params
    |> RepositoriosGet.create_user()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, %User{} = user}, conn, view, status) do
    user_data = Map.delete(user, :__meta__)
    json_data = Poison.encode!(user_data)

    conn
    # :ok === 200
    |> put_status(status)
    |> render(view, user: json_data)
  end

  defp handle_response({:error, %Error{} = error}, _conn, _view, _status), do: error
end

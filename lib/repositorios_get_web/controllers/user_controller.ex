defmodule RepositoriosGetWeb.UserController do
  use RepositoriosGetWeb, :controller
  use Phoenix.Controller
  alias RepositoriosGet.User
  alias RepositoriosGet.Error
  alias RepositoriosGetWeb.FallbackController
  alias RepositoriosGetWeb.Auth.Guardian
  # plug Plug.Parsers, parsers: [:json], pass: ["*/*"], json_decoder: Poison

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %User{} = user} <- RepositoriosGet.create_user(),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user)

    conn
    |> handle_response("create.json",token: token, :created, user)
  end

  defp handle_response(%User{} = user, conn, view, status) do
    user_data = Map.delete(user, :__meta__)
    json_data = Poison.encode!(user_data)

    conn
    # :ok === 200
    |> put_status(status)
    |> render(view, user: json_data)
  end

  defp handle_response({:error, %Error{} = error}, _conn, _view, _status), do: error
end

defmodule RepositoriosGetWeb.FallbackController do
  use RepositoriosGetWeb, :controller

  alias RepositoriosGet.Error
  alias RepositoriosGetWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end

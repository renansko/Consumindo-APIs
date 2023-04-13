defmodule RepositoriosGetWeb.UserControler do
  use RepositoriosGetWeb, :controller

  alias RepositoriosGet.User
  alias RepositoriosGetWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- RepositoriosGet.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end

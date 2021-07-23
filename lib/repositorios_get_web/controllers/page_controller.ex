defmodule RepositoriosGetWeb.PageController do
  use RepositoriosGetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

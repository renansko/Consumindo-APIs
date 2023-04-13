defmodule RepositoriosGetWeb.ClientController do
  use RepositoriosGetWeb, :controller

  def show(conn, %{"id" => id}) do
    {:ok, {:ok, list}} =
      id
      |> checkList()

    conn
    |> put_status(200)
    |> render("list.json", list: list)
  end

  defp checkList(id) do
    case RepositoriosGet.get_user(id) do
      {:error, _} -> {:error, "deu ruim"}
      list -> {:ok, list}
    end
  end
end

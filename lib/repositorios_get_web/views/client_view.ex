defmodule RepositoriosGetWeb.ClientView do
  use RepositoriosGetWeb, :view

  def render("list.json", %{list: list}) do
    %{message: "List of repos of ", list: list}
  end
end

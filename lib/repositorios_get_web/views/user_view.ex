defmodule RepositoriosGetWeb.UserView do
  use RepositoriosGetWeb, :view

  alias RepositoriosGet.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end
end

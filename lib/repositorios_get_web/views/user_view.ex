defmodule RepositoriosGetWeb.UserView do
  use RepositoriosGetWeb, :view

  alias RepositoriosGet.User

  def render("create.json",token: token, %{user: user}) do
    user =
      Poison.decode!(user,
        as: %{
          "username" => :string,
          "updated_at" => :string,
          "password_hash" => :string,
          "password" => :string,
          "inserted_at" => :string,
          "id" => :string,
          "email" => :string
        }
      )

    %{
      message: "User created!",
      user: user,
      token: token
    }
  end
end

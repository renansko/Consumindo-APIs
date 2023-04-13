defmodule RepositoriosGet.Users.Create do
  alias RepositoriosGet.{Error, User}

  def call(params) do
    changeset = User.changeset(params)

    with {:ok, %User{}} = user <- User.build(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end

defmodule RepositoriosGet.Users.Get do
  alias RepositoriosGet.{Error, Repo, User}

  def by_email(email) do
    case Repo.get(User, where: [email: email]) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end

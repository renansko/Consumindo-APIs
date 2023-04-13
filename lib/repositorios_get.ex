defmodule RepositoriosGet do
  alias RepositoriosGet.RepoGet.Client, as: GetUser
  alias RepositoriosGet.Users.Create, as: CreateUser

  defdelegate get_user(name), to: GetUser, as: :get_repo_indo
  defdelegate create_user(name), to: CreateUser, as: :call
end

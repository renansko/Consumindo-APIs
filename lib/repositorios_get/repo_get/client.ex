defmodule RepositoriosGet.RepoGet.Client do
  use Tesla

  alias Tesla.Env
  alias RepositoriosGet.Error
  alias RepositoriosGet.RepoGet.Rebuild

  alias Github.Behabiour
  alias Github.RepoInfo

  @behaviour Behaviour

  @base_url "https://api.github.com"
  @request_headers [
    {"User-Agent",
     "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"}
  ]
  plug Tesla.Middleware.Headers, @request_headers
  plug Tesla.Middleware.JSON

  def get_repo_indo(url \\ @base_url, username) do
    "#{url}/users/#{username}/repos"
    |> get()
    |> handle_response()
  end

  defp handle_response({:error, reason}), do: {:error, Error.build(:bad_request, reason)}

  defp handle_response({:ok, %Env{status: 404, body: _body}}),
    do: {:error, Error.build(:not_found, "Github user not found")}

  defp handle_response({:ok, %Env{status: 200, body: raw_repos}}),
    do: {:ok, Rebuild.build_many(raw_repos)}
end

defmodule RepositoriosGet.RepoGet.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.JSON

  alias Tesla.Env
  alias Repositorios_get.Error

  def get_repo_indo(nickname) do
    "#{nickname}/repos"
    |> get()
    |> handle_response()
  end

  defp handle_response(
         {:ok,
          %Env{
            status: 403,
            body:
              "\r\nRequest forbidden by administrative rules. Please make sure your request has a User-Agent header (http://developer.github.com/v3/#user-agent-required). Check https://developer.github.com for other possible causes.\r\n"
          }}
       ) do
    {:error, Error.build(403, "not authorized")}
  end

  defp handle_response({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end
end

# https://github.com/librity/ignite_jwt_ttl/blob/main/mix.exs

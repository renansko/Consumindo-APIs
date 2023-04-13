defmodule RepositoriosGetWeb.Auth.PipelinRepositoriosGetWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :repositorios_get

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.LoadResource
  plug Guardian.Plug.EnsureAuthenticated
end

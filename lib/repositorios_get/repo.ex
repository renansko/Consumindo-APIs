defmodule RepositoriosGet.Repo do
  use Ecto.Repo,
    otp_app: :repositorios_get,
    adapter: Ecto.Adapters.Postgres
end

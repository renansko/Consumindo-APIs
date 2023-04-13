defmodule RepositoriosGet.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :id, :uuid, primary_key: true
      add :email, :string
      add :password_hash, :string
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end

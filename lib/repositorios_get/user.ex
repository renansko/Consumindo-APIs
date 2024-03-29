defmodule RepositoriosGet.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @derive Jason.Encoder
  @fields [:username, :email, :password]
  def build(changeset), do: apply_action(changeset, :create)

  schema "users" do
    field(:username, :string)
    field(:email, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end

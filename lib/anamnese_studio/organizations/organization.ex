defmodule AnamneseStudio.Organizations.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "organizations" do
    field :name, :string
    field :slug, :string
    field :plan, :string
    field :max_users, :integer
    field :active, :boolean, default: false
    field :owner_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(organization, attrs, user_scope) do
    organization
    |> cast(attrs, [:name, :slug, :plan, :max_users, :active])
    |> validate_required([:name, :slug, :plan, :max_users, :active])
    |> put_change(:owner_id, user_scope.user.id)
  end
end

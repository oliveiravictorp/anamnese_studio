defmodule AnamneseStudio.Memberships.Membership do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "memberships" do
    field :role, :string
    field :joined_at, :utc_datetime

    belongs_to :organization, AnamneseStudio.Organizations.Organization, type: :binary_id
    belongs_to :user, AnamneseStudio.Accounts.User, type: :binary_id

    timestamps(type: :utc_datetime)
  end

  def changeset(membership, attrs) do
    membership
    |> cast(attrs, [:role, :joined_at, :organization_id, :user_id])
    |> validate_required([:organization_id, :user_id])
    |> unique_constraint([:organization_id, :user_id])
  end
end

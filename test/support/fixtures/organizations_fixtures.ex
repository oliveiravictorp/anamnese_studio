defmodule AnamneseStudio.OrganizationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AnamneseStudio.Organizations` context.
  """

  @doc """
  Generate a organization.
  """
  def organization_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        active: true,
        max_users: 42,
        name: "some name",
        plan: "some plan",
        slug: "some slug"
      })

    {:ok, organization} = AnamneseStudio.Organizations.create_organization(scope, attrs)
    organization
  end
end

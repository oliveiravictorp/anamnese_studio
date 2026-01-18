defmodule AnamneseStudioWeb.UserHomeLive do
  use AnamneseStudioWeb, :live_view

  alias AnamneseStudio.Organizations
  alias AnamneseStudio.Accounts.Scope

  @impl true
  def mount(_params, _session, socket) do
    scope = socket.assigns.current_scope
    organizations = if scope, do: Organizations.list_organizations(scope), else: []

    socket =
      socket
      |> assign(:page_title, "Selecione organização")
      |> assign(:organizations, organizations)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <.header>
        {@page_title}
        <:subtitle>Selecione uma organização ou crie uma nova.</:subtitle>
      </.header>

      <div class="px-6 py-4">
        <%= if @organizations == [] do %>
          <div class="text-gray-600">Você ainda não pertence a nenhuma organização.</div>
          <div class="mt-4">
            <.link navigate={~p"/organizations/new"} class="btn btn-primary">Criar organização</.link>
          </div>
        <% else %>
          <div class="space-y-3">
            <.link navigate={~p"/organizations/new"} class="btn">Criar nova organização</.link>
            <div class="mt-4">
              <ul>
                <%= for org <- @organizations do %>
                  <li class="py-2">
                    <.link navigate={~p"/organizations/#{org}"} class="text-lg text-blue-600">
                      {org.name}
                    </.link>
                  </li>
                <% end %>
              </ul>
            </div>
          </div>
        <% end %>
      </div>
    </Layouts.app>
    """
  end
end

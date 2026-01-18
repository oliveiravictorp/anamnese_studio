defmodule AnamneseStudioWeb.UserLive.Home do
  use AnamneseStudioWeb, :live_view

  alias AnamneseStudio.Organizations

  @impl true
  def mount(_params, _session, socket) do
    scope = socket.assigns.current_scope
    organizations = if scope, do: Organizations.list_organizations(scope), else: []

    socket =
      socket
      |> assign(:page_title, "Oganizações")
      |> assign(:organizations, organizations)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <.header>
        {@page_title}
        <:subtitle>Selecione uma organização, crie uma nova ou aguarde um convite.</:subtitle>
        <:actions>
          <.button variant="primary" navigate={~p"/organizations/new"}>
            <.icon name="hero-plus" /> Criar organização
          </.button>
        </:actions>
      </.header>

      <div class="px-6 py-4">
        <%= if @organizations == [] do %>
          <div class="text-gray-600">Você ainda não pertence a nenhuma organização.</div>
        <% else %>
          <div class="space-y-3">
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

defmodule AnamneseStudioWeb.PageController do
  use AnamneseStudioWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

defmodule AnamneseStudioWeb.ErrorJSONTest do
  use AnamneseStudioWeb.ConnCase, async: true

  test "renders 404" do
    assert AnamneseStudioWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert AnamneseStudioWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

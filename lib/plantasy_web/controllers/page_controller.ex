defmodule PlantasyWeb.PageController do
  use PlantasyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

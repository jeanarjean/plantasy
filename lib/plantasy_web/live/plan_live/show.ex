defmodule PlantasyWeb.PlanLive.Show do
  use PlantasyWeb, :live_view

  alias Plantasy.Strategy

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _url, socket) do
    plan = Strategy.get_plan!(id)

    {:noreply,
     socket
     |> assign(:page_title, "Plantasy")
     |> assign(:plan, plan)}
  end
end

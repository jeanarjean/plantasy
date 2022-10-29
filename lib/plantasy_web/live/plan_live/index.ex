defmodule PlantasyWeb.PlanLive.Index do
  use PlantasyWeb, :live_view

  alias Plantasy.Strategy

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :plans, list_plans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Plantasy")
    |> assign(:plan, nil)
  end

  defp list_plans do
    Strategy.list_plans()
  end
end

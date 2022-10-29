defmodule PlantasyWeb.PlanLive.Index do
  use PlantasyWeb, :live_view

  alias Plantasy.Strategy
  alias Plantasy.Strategy.Plan

  @impl true
  def mount(_params, _session, socket) do
    changeset = Plan.changeset(%Plan{}, %{})

    {:ok,
     socket
     |> assign(:changeset, changeset)
     |> assign(:plans, list_plans())}
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

  @impl true
  def handle_event("validate", %{"plan" => params}, socket) do
    changeset =
      %Plan{}
      |> Strategy.change_plan(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  @impl true
  def handle_event("save", %{"plan" => params}, socket) do
    case Strategy.create_plan(params) do
      {:ok, plan} ->
        {:noreply,
         socket
         |> put_flash(:info, "Plan saved successfully!")
         |> redirect(to: Routes.plan_show_path(socket, :show, plan))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp list_plans do
    Strategy.list_plans()
  end
end

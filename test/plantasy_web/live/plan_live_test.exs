defmodule PlantasyWeb.PlanLiveTest do
  use PlantasyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Plantasy.StrategyFixtures

  @create_attrs %{goals_10_years: [], goals_1_year: [], goals_5_years: []}
  @update_attrs %{goals_10_years: [], goals_1_year: [], goals_5_years: []}
  @invalid_attrs %{goals_10_years: [], goals_1_year: [], goals_5_years: []}

  defp create_plan(_) do
    plan = plan_fixture()
    %{plan: plan}
  end

  describe "Index" do
    setup [:create_plan]

    test "lists all plans", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.plan_index_path(conn, :index))

      assert html =~ "Listing Plans"
    end

    test "saves new plan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.plan_index_path(conn, :index))

      assert index_live |> element("a", "New Plan") |> render_click() =~
               "New Plan"

      assert_patch(index_live, Routes.plan_index_path(conn, :new))

      assert index_live
             |> form("#plan-form", plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#plan-form", plan: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plan_index_path(conn, :index))

      assert html =~ "Plan created successfully"
    end

    test "updates plan in listing", %{conn: conn, plan: plan} do
      {:ok, index_live, _html} = live(conn, Routes.plan_index_path(conn, :index))

      assert index_live |> element("#plan-#{plan.id} a", "Edit") |> render_click() =~
               "Edit Plan"

      assert_patch(index_live, Routes.plan_index_path(conn, :edit, plan))

      assert index_live
             |> form("#plan-form", plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#plan-form", plan: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plan_index_path(conn, :index))

      assert html =~ "Plan updated successfully"
    end

    test "deletes plan in listing", %{conn: conn, plan: plan} do
      {:ok, index_live, _html} = live(conn, Routes.plan_index_path(conn, :index))

      assert index_live |> element("#plan-#{plan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#plan-#{plan.id}")
    end
  end

  describe "Show" do
    setup [:create_plan]

    test "displays plan", %{conn: conn, plan: plan} do
      {:ok, _show_live, html} = live(conn, Routes.plan_show_path(conn, :show, plan))

      assert html =~ "Show Plan"
    end

    test "updates plan within modal", %{conn: conn, plan: plan} do
      {:ok, show_live, _html} = live(conn, Routes.plan_show_path(conn, :show, plan))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Plan"

      assert_patch(show_live, Routes.plan_show_path(conn, :edit, plan))

      assert show_live
             |> form("#plan-form", plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#plan-form", plan: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plan_show_path(conn, :show, plan))

      assert html =~ "Plan updated successfully"
    end
  end
end

defmodule Plantasy.StrategyTest do
  use Plantasy.DataCase

  alias Plantasy.Strategy

  describe "plans" do
    alias Plantasy.Strategy.Plan

    import Plantasy.StrategyFixtures

    @invalid_attrs %{goals_10_years: nil, goals_1_year: nil, goals_5_years: nil}

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Strategy.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Strategy.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      valid_attrs = %{goals_10_years: [], goals_1_year: [], goals_5_years: []}

      assert {:ok, %Plan{} = plan} = Strategy.create_plan(valid_attrs)
      assert plan.goals_10_years == []
      assert plan.goals_1_year == []
      assert plan.goals_5_years == []
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Strategy.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      update_attrs = %{goals_10_years: [], goals_1_year: [], goals_5_years: []}

      assert {:ok, %Plan{} = plan} = Strategy.update_plan(plan, update_attrs)
      assert plan.goals_10_years == []
      assert plan.goals_1_year == []
      assert plan.goals_5_years == []
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Strategy.update_plan(plan, @invalid_attrs)
      assert plan == Strategy.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Strategy.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Strategy.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Strategy.change_plan(plan)
    end
  end
end

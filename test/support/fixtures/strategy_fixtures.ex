defmodule Plantasy.StrategyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Plantasy.Strategy` context.
  """

  @doc """
  Generate a plan.
  """
  def plan_fixture(attrs \\ %{}) do
    {:ok, plan} =
      attrs
      |> Enum.into(%{
        goals_10_years: [],
        goals_1_year: [],
        goals_5_years: []
      })
      |> Plantasy.Strategy.create_plan()

    plan
  end
end

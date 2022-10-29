defmodule Plantasy.Strategy.Plan do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "plans" do
    field :goals_10_years, {:array, :string}
    field :goals_1_year, {:array, :string}
    field :goals_5_years, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:goals_10_years, :goals_5_years, :goals_1_year])
    |> validate_required([:goals_10_years, :goals_5_years, :goals_1_year])
  end
end

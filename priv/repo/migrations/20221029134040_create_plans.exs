defmodule Plantasy.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :goals_10_years, {:array, :string}
      add :goals_5_years, {:array, :string}
      add :goals_1_year, {:array, :string}

      timestamps()
    end
  end
end

defmodule Plantasy.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false

      add :goals_10_years, {:array, :string}
      add :goals_5_years, {:array, :string}
      add :goals_1_year, {:array, :string}

      timestamps()
    end
  end
end

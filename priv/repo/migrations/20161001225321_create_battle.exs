defmodule BattleTracker.Repo.Migrations.CreateBattle do
  use Ecto.Migration

  def change do
    create table(:battles) do
      add :points, :integer
      add :scenario, :string
      add :won, :boolean, default: false, null: false
      add :victory_condition, :string
      add :own_faction, :string
      add :own_leader, :string
      add :opponent_faction, :string
      add :opponent_leader, :string
      add :opponent_name, :string
      add :date, :date

      timestamps()
    end

  end
end

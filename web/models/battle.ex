defmodule BattleTracker.Battle do
  use BattleTracker.Web, :model

  schema "battles" do
    field :points, :integer
    field :scenario, :string
    field :won, :boolean, default: false
    field :victory_condition, :string
    field :own_faction, :string
    field :own_leader, :string
    field :opponent_faction, :string
    field :opponent_leader, :string
    field :opponent_name, :string
    field :date, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:points, :scenario, :won, :victory_condition, :own_faction, :own_leader, :opponent_faction, :opponent_leader, :opponent_name, :date])
    |> validate_required([:points, :scenario, :won, :victory_condition, :own_faction, :own_leader, :opponent_faction, :opponent_leader, :opponent_name, :date])
  end
end

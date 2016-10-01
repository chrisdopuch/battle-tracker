defmodule BattleTracker.BattleTest do
  use BattleTracker.ModelCase

  alias BattleTracker.Battle

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, opponent_faction: "some content", opponent_leader: "some content", opponent_name: "some content", own_faction: "some content", own_leader: "some content", points: 42, scenario: "some content", victory_condition: "some content", won: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Battle.changeset(%Battle{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Battle.changeset(%Battle{}, @invalid_attrs)
    refute changeset.valid?
  end
end

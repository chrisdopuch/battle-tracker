defmodule BattleTracker.Repo.Migrations.AddPhotoPathToBattle do
  use Ecto.Migration

  def change do
    alter table(:battles) do
      add :photo_path, :string
    end
  end
end

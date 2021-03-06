defmodule BattleTracker.BattleController do
  use BattleTracker.Web, :controller

  alias BattleTracker.Battle

  def index(conn, _params) do
    battles = Repo.all(Battle)
    render(conn, "index.html", battles: battles)
  end

  def new(conn, _params) do
    changeset = Battle.changeset(%Battle{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"battle" => battle_params}) do
    if upload = battle_params["photo"] do
      # temporarily store the photo on the filesystem
      # this is actually copied to the root dir /media
      # I had to chmod it to allow elixir to write to that location
      # short term I should move it to somewhere inside the repo
      # long term I should integrate with some kind of cloud storage like imgur or AWS
      File.cp(upload.path, "/media/#{upload.filename}")
    end

    new_params =
      case Map.has_key?(battle_params, "photo") do
        true -> Map.merge(battle_params, %{"photo_path" => "/media/#{battle_params["photo"].filename}"})
        false -> battle_params
      end

    changeset = Battle.changeset(%Battle{}, new_params)

    case Repo.insert(changeset) do
      {:ok, _battle} ->
        conn
        |> put_flash(:info, "Battle created successfully.")
        |> redirect(to: battle_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    battle = Repo.get!(Battle, id)
    render(conn, "show.html", battle: battle)
  end

  def edit(conn, %{"id" => id}) do
    battle = Repo.get!(Battle, id)
    changeset = Battle.changeset(battle)
    render(conn, "edit.html", battle: battle, changeset: changeset)
  end

  def update(conn, %{"id" => id, "battle" => battle_params}) do
    battle = Repo.get!(Battle, id)
    changeset = Battle.changeset(battle, battle_params)

    case Repo.update(changeset) do
      {:ok, battle} ->
        conn
        |> put_flash(:info, "Battle updated successfully.")
        |> redirect(to: battle_path(conn, :show, battle))
      {:error, changeset} ->
        render(conn, "edit.html", battle: battle, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    battle = Repo.get!(Battle, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(battle)

    conn
    |> put_flash(:info, "Battle deleted successfully.")
    |> redirect(to: battle_path(conn, :index))
  end
end

defmodule BattleTracker.PageController do
  use BattleTracker.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

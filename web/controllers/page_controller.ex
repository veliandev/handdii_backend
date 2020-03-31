defmodule HanddiiBackend.PageController do
  use HanddiiBackend.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule BrainfuckServerWeb.PageController do
  use BrainfuckServerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

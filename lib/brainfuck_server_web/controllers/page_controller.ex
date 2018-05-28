defmodule BrainfuckServerWeb.PageController do
  use BrainfuckServerWeb, :controller

  alias BrainfuckServer.Programs
  alias BrainfuckServer.Programs.Program

  def index(conn, _params) do
    changeset = Programs.change_program(%Program{})
    render(conn, "index.html", changeset: changeset)
  end
end

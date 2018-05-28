defmodule BrainfuckServerWeb.ProgramControllerTest do
  use BrainfuckServerWeb.ConnCase

  alias BrainfuckServer.Programs

  @create_attrs %{source: "some source", title: "some title"}
  @update_attrs %{source: "some updated source", title: "some updated title"}
  @invalid_attrs %{source: nil, title: nil}

  def fixture(:program) do
    {:ok, program} = Programs.create_program(@create_attrs)
    program
  end

  describe "index" do
    test "lists all programs", %{conn: conn} do
      conn = get conn, program_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Programs"
    end
  end

  describe "new program" do
    test "renders form", %{conn: conn} do
      conn = get conn, program_path(conn, :new)
      assert html_response(conn, 200) =~ "New Program"
    end
  end

  describe "create program" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, program_path(conn, :create), program: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == program_path(conn, :show, id)

      conn = get conn, program_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Program"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, program_path(conn, :create), program: @invalid_attrs
      assert html_response(conn, 200) =~ "New Program"
    end
  end

  describe "edit program" do
    setup [:create_program]

    test "renders form for editing chosen program", %{conn: conn, program: program} do
      conn = get conn, program_path(conn, :edit, program)
      assert html_response(conn, 200) =~ "Edit Program"
    end
  end

  describe "update program" do
    setup [:create_program]

    test "redirects when data is valid", %{conn: conn, program: program} do
      conn = put conn, program_path(conn, :update, program), program: @update_attrs
      assert redirected_to(conn) == program_path(conn, :show, program)

      conn = get conn, program_path(conn, :show, program)
      assert html_response(conn, 200) =~ "some updated source"
    end

    test "renders errors when data is invalid", %{conn: conn, program: program} do
      conn = put conn, program_path(conn, :update, program), program: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Program"
    end
  end

  describe "delete program" do
    setup [:create_program]

    test "deletes chosen program", %{conn: conn, program: program} do
      conn = delete conn, program_path(conn, :delete, program)
      assert redirected_to(conn) == program_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, program_path(conn, :show, program)
      end
    end
  end

  defp create_program(_) do
    program = fixture(:program)
    {:ok, program: program}
  end
end

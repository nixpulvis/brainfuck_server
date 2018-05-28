defmodule BrainfuckServer.ProgramsTest do
  use BrainfuckServer.DataCase

  alias BrainfuckServer.Programs

  describe "programs" do
    alias BrainfuckServer.Programs.Program

    @valid_attrs %{source: "some source", title: "some title"}
    @update_attrs %{source: "some updated source", title: "some updated title"}
    @invalid_attrs %{source: nil, title: nil}

    def program_fixture(attrs \\ %{}) do
      {:ok, program} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Programs.create_program()

      program
    end

    test "list_programs/0 returns all programs" do
      program = program_fixture()
      assert Programs.list_programs() == [program]
    end

    test "get_program!/1 returns the program with given id" do
      program = program_fixture()
      assert Programs.get_program!(program.id) == program
    end

    test "create_program/1 with valid data creates a program" do
      assert {:ok, %Program{} = program} = Programs.create_program(@valid_attrs)
      assert program.source == "some source"
      assert program.title == "some title"
    end

    test "create_program/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Programs.create_program(@invalid_attrs)
    end

    test "update_program/2 with valid data updates the program" do
      program = program_fixture()
      assert {:ok, program} = Programs.update_program(program, @update_attrs)
      assert %Program{} = program
      assert program.source == "some updated source"
      assert program.title == "some updated title"
    end

    test "update_program/2 with invalid data returns error changeset" do
      program = program_fixture()
      assert {:error, %Ecto.Changeset{}} = Programs.update_program(program, @invalid_attrs)
      assert program == Programs.get_program!(program.id)
    end

    test "delete_program/1 deletes the program" do
      program = program_fixture()
      assert {:ok, %Program{}} = Programs.delete_program(program)
      assert_raise Ecto.NoResultsError, fn -> Programs.get_program!(program.id) end
    end

    test "change_program/1 returns a program changeset" do
      program = program_fixture()
      assert %Ecto.Changeset{} = Programs.change_program(program)
    end
  end
end

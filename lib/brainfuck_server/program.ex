defmodule BrainfuckServer.Program do
  use Ecto.Schema
  import Ecto.Changeset


  schema "programs" do
    field :source, :string, null: false
    field :title, :string
    field :valid, :boolean

    timestamps()
  end

  @doc false
  def changeset(program, attrs) do
    program
    |> cast(attrs, [:title, :source, :valid])
    |> validate_required([:source])
  end
end

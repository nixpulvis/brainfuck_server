defmodule BrainfuckServer.Repo.Migrations.CreatePrograms do
  use Ecto.Migration

  def change do
    create table(:programs) do
      add :title, :string
      add :source, :text, null: false
      add :valid, :boolean

      timestamps()
    end

  end
end

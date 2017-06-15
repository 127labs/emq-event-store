defmodule EmqEventStore.Repo.Migrations.AddEventsTable do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :aggregate_id, :binary_id
      add :type, :string
      add :data, :map

      timestamps(updated_at: false)
    end
  end
end

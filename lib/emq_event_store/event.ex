defmodule EmqEventStore.Event do
  use Ecto.Schema

  import Ecto.Changeset

  @allowed [:type, :data, :aggregate_id]
  @required [:type, :aggregate_id]

  schema "events" do
    field :type, :string
    field :data, :map
    field :aggregate_id, :binary_id

    timestamps(updated_at: false)
  end

  def new(event, payload) do
    attributes =
      Map.new
      |> Map.put(:type, event)
      |> Map.put(:data, payload)

    __MODULE__
    |> struct()
    |> changeset(attributes)
  end

  def changeset(schema, attributes \\ %{}) do
    schema
    |> cast(attributes, @allowed)
    |> validate_required(@required)
  end
end

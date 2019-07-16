defmodule ChatApp.Talk do
  alias ChatApp.Repo
  alias ChatApp.Talk.Room

  def list_rooms(), do: Repo.all(Room)
  def get_room(id), do: Repo.get!(Room, id)
  def change_room(%Room{} = room), do: Room.changeset(room, %{})
  def delete_room(%Room{} = room), do: Repo.delete(room)

  def create_rooms(attrs \\ %{}) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update
  end
end

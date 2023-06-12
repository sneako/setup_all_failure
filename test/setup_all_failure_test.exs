defmodule SetupAllFailureTest do
  use ExUnit.Case
  doctest SetupAllFailure

  setup_all do
    Process.exit(self(), :error)

    # These also trigger the issue
    # spawn_link(fn -> Process.exit(self(), :error) end)
    # spawn_link(fn -> :erlang.atom_to_binary({:some, :tuple}) end)
  end

  test "greets the world" do
    assert SetupAllFailure.hello() == :world
  end
end

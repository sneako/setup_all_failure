defmodule SetupAllFailureTest do
  use ExUnit.Case
  doctest SetupAllFailure

  setup_all do
    Process.exit(self(), :error)
    # This also triggers the issue
    # spawn_link(fn -> Process.exit(self(), :error) end)
  end

  test "greets the world" do
    assert SetupAllFailure.hello() == :world
  end
end

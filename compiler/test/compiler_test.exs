defmodule CompilerTest do
  use ExUnit.Case
  doctest Compiler

  test "greets the world" do
    assert Compiler.hello() == :world
  end
end

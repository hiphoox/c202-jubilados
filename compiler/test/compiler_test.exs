defmodule CompilerTest do
  use ExUnit.Case
  doctest Compiler

 test "When the code is fine should send nil" do
    assert Compiler.compile_file("examples/valid/return_2.c") == nil
  end

 test "prueba 2" do
    assert Compiler.compile_file("examples/invalid/no_space.c") == nil
  end

end
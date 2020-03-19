defmodule Orchestrator do
  def manager(file, path, opt) do
    IO.inspect(file)
  with  {:ok, tok} <- Scanner.scan_program(file, opt),
        {:ok, ast} <- Parser.init_parse(tok, opt),
        {:ok, asm} <- CodeGenerator.generate_code(ast, opt, path),
        {:ok, _} <- Linker.binary_output(asm, opt, path)
        do
        IO.puts("Success process")
  else
        {:error, error} -> IO.puts(error)
        {:tokens, _} -> IO.puts("Lexer Output")
        {:ast, _} -> IO.puts("Abstract Syntax Tree Output")
        {:asm, asm} ->IO.puts(asm)
      end
    end
end
defmodule Compiler do
  @moduledoc """
  Documentation for `Compiler`.
  """
@commands %{
    "h" => "Prints this help",
  }

  def main(args) do
    args
    |> parse_args
    |> process_args
  end

  def parse_args(args) do
    OptionParser.parse(args, switches: [h: :boolean])
  end

  defp process_args({[h: true], _, _}) do
    init_help()
  end

  defp process_args({_, [file_name], _}) do
    compile_file(file_name)
  end

  defp compile_file(file_path) do
    IO.puts("Compiling file: " <> file_path)
    assembly_path = String.replace_trailing(file_path, ".c", ".s")

    tokens_list = File.read!(file_path)
    |> clean_code()
    |> Scanner.scan_words()

    result = evaluator_lexer(tokens_list)
    if result == [] do
      astTree = tokens_list
      |> Parser.parse_program()

      if is_map(astTree) do
        astTree
        |> CodeGenerator.generate_code()
        |> Linker.generate_binary(assembly_path)
        |> IO.inspect()
      end

      if is_tuple(astTree) do
        IO.puts("Syntax Error")
        {_,_,error_line,atom} = astTree
        error_line = to_string(error_line+1)
        error_reason = to_string(atom)
        error_message = "Error:  " <> error_line <> " : "<> error_reason
        IO.inspect(error_message)
      end

    else
      IO.puts("Lexical Error:")
      [_,word_error,line] = result
      error_line = to_string(line+1)
      error_message = "Error: " <> error_line <> ":is not expected: " <> word_error
      IO.inspect(error_message)
    end
end  

  defp clean_code(file_content) do
    divide_code = String.trim(file_content)
    clean_words = Regex.split(~r/\n/,divide_code)
    counter = 0
    get_tokens(clean_words,counter)
 end

  def get_tokens(program,line) when program != []  do
    lines = hd program
    extra_lines = tl program
    tokens = Regex.split(~r/\s+/, lines, trim: true)
    tokens_in_line = Enum.flat_map(tokens, fn token -> [{token,line}] end)
    line = line + 1
    others = get_tokens(extra_lines,line)
    tokens_in_line ++ others
  end

  def get_tokens(_program,_linea)  do
    []
  end

  def evaluator_lexer(tokens_list) when tokens_list != [] do
      head= hd tokens_list
      tail= tl tokens_list
      if is_list(head) do
        head
      else
        evaluator_lexer(tail)
      end
  end

  def evaluator_lexer(tokens_list)  do
    []
  end

  defp init_help do
    IO.puts("\nnqcc --h file_name \n")

    IO.puts("\nThe compiler supports following options:\n")

    @commands
    |> Enum.map(fn {command, description} -> IO.puts("  #{command} - #{description}") end)
  end

end
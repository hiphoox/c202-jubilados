defmodule Compiler do
  @moduledoc """
  Documentation for `Compiler`.
  """

  def main(args) do
    case args do
      ["-h"] -> init_help() |> IO.puts();
      [path] -> if path =~ ".c", do: compile_file(path, :no_output), else: show_error(1) |> IO.puts;
      ["-t", path] -> compile_file(path, :show_token); 
      ["-s", path] -> compile_file(path, :show_asm); 
      ["-a", path] -> compile_file(path, :show_ast);
      ["-o", path, new_name] -> compile_file(path, new_name);
      _ -> show_error(1) |> IO.puts;
           show_error(1)
    end
  end

  def compile_file(file_path, flag) do
      if file_path =~ ".c" and File.exists?(file_path) do
       Orchestrator.manager(clean_code(File.read!(file_path)), file_path, flag);
     else
       show_error(3) |> IO.puts;
       show_error(3);
     end
end  

  def clean_code(file_content) do
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

  defp init_help do
    IO.puts("\nnqcc --h file_name \n")

    IO.puts("\nThe compiler supports following options:\n")

  end

    def show_error(num) do
     case num do
       1 -> "Escriba -h para la ayuda." 
       2 -> "Comando(s) no válido. Escriba -h para la ayuda."
       3 -> "Archivo inválido o no existe en el directorio." 
     end
   end

end
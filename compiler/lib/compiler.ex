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

  #Prueba

  ## Examples compilers
  ## View for integrated

  """
  def main(_args) do
    IO.puts("Hello World!")
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
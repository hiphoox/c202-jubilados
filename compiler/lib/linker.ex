defmodule Linker do
  def binary_output(assembler, flag, assembly_path) do
    IO.puts("assembler")
  	assembly_path = String.replace_trailing(assembly_path, ".c", ".s")
    assembly_file_name = Path.basename(assembly_path)
    binary_file_name = Path.basename(assembly_path, ".s")
    output_dir_name = Path.dirname(assembly_path)
    assembly_path = output_dir_name <> "/" <> assembly_file_name


    File.write!(assembly_path, assembler)
    System.cmd("gcc", [binary_file_name <> ".c", "-o#{binary_file_name}"], cd: output_dir_name)

    compile = File.rm!(assembly_path)
    {:ok, compile} 
  end

end
defmodule Utils do
  @moduledoc """
  Documentation for `Utils`.
  """
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
end
defmodule Scanner do
  def scan_words(words) do
    Enum.flat_map(words, &find_tokens/1)
  end

  def find_tokens({program,line}) when program != "" do
    line_keyword = line
    {token, rest} =
      case program do
        "{" <> rest ->
          {{:open_brace,line_keyword}, rest}

        "}" <> rest ->
          {{:close_brace,line_keyword}, rest}

        "(" <> rest ->
          {{:open_paren,line_keyword}, rest}

        ")" <> rest ->
          {{:close_paren,line_keyword}, rest}

        ";" <> rest ->
          {{:semicolon, line_keyword}, rest}

        "return" <> rest ->
          {{:return_keyword, line_keyword}, rest}

        "int" <> rest ->
          {{:int_keyword, line_keyword}, rest}

        "main" <> rest ->
          {{:main_keyword, line_keyword}, rest}

        rest ->
          get_constant(rest,line)
      end
  if rest != "" do
    aux_token = {rest,line}
    remaining_tokens = find_tokens(aux_token)
    [token | remaining_tokens]
  else
    remaining_tokens = find_tokens(rest)
    [token | remaining_tokens]
  end

  end

  def find_tokens(_program) do
    []
  end

  def get_constant(program,line) do
    value = Regex.run(~r/^\d+/, program)
    if value != :nil do
      case value do
        [value_number] ->
        {{{:constant, String.to_integer(value_number)},line}, String.trim_leading(program, value_number)}
      end
    else
      {["ERROR: not found return value", program, line], ""}
    end
  end
end
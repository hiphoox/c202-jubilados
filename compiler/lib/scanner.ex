defmodule Scanner do
  def scan_program(words, flag) do
    case words do
      [""] -> {:error, "Error. the file is empty."}
        _ ->  start_scan(words, flag)
    end
  end

  def start_scan(words, flag) do
      token_list = Enum.flat_map(words, &find_tokens/1)
    if Enum.member?(token_list, :error) do
      {:error, "Lexer Error." }
    else
       if flag == :show_token do
        IO.inspect("***** This is the token List *****")
        IO.inspect(token_list)
        {:tokens, token_list}
       else
         {:ok, token_list}
       end
     end
  end

  def find_tokens({program,line}) when program != "" do
    line_keyword = line
    IO.inspect({program,line})
    {token, rest} =
      case program do
        "{"  <> rest  -> {{:open_brace, line_keyword}, rest}
        "}"  <> rest  -> {{:close_brace, line_keyword}, rest}
        "("  <> rest  -> {{:open_paren, line_keyword}, rest}
        ")"  <> rest  -> {{:close_paren, line_keyword}, rest}
        ";"  <> rest  -> {{:semicolon, line_keyword}, rest}
        "-"  <> rest  -> {{:neg_operator, line_keyword}, rest}
        "&&" <> rest  -> {{:and_operator, line_keyword},rest}
        "||" <> rest  -> {{:or_operator, line_keyword},rest}
        "<=" <> rest  -> {{:less_than_or_equal_operator, line_keyword},rest}
        "<"  <> rest  -> {{:less_than_operator, line_keyword},rest}
        ">=" <> rest  -> {{:greater_than_or_equal_operator, line_keyword},rest}
        ">"  <> rest  -> {{:greater_than_operator, line_keyword},rest}
        "==" <> rest  -> {{:equal_operator, line_keyword},rest}
        "!=" <> rest  -> {{:not_equal_operator, line_keyword},rest}
        "!"  <> rest  -> {{:logical_neg_operator, line_keyword}, rest}
        "~"  <> rest  -> {{:bitwise_operator, line_keyword}, rest}
        "+"  <> rest  -> {{:add_operator, line_keyword}, rest}
        "*"  <> rest  -> {{:mult_operator, line_keyword}, rest}
        "/"  <> rest  -> {{:div_operator, line_keyword}, rest}
        "return" <> rest -> {{:return_keyword, line_keyword}, rest}
        "int" <> rest -> {{:int_keyword, line_keyword}, rest}
        "main" <> rest -> {{:main_keyword, line_keyword}, rest}
        :error -> {:error, nil}
        rest -> get_constant(rest,line)
       end
        aux_token = {rest,line}
        remaining_tokens = find_tokens(aux_token)
        [token | remaining_tokens]
  end

  def find_tokens(_program) do
    []
  end

  def get_constant(remain_string, line) do
    value = Regex.run(~r/^\d+/, remain_string)
    if value != :nil do
      case value do
        [value_number] -> {{{:constant, String.to_integer(value_number)}, line}, String.trim_leading(remain_string, value_number)}
      end
    else
      {["ERROR: not found return value", remain_string, line], ""}
      {:error, "invalid return value"}
    end
   end 
   
end
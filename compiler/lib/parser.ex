defmodule Parser do
  def parse_program(token_list) do
    function = parse_function(token_list, 0)
    case function do
      {{:error, error_message, line, problema}, _rest} ->
        {:error, error_message, line, problema}

      {function_node, rest} ->
        if rest == [] do
          %AST{node_name: :program, left_node: function_node}
        else
          {:error, "Error: there are more elements after function end", 0, "more elements"}
        end
    end
  end

  def parse_function([{next_token, num_line} | rest], counter) do
    if rest != [] do
      case counter do
        0->
          if next_token == :int_keyword do
            counter = counter+1
            parse_function(rest,counter)
          else
            {{:error, "Error 1",num_line,next_token},rest}
          end
        1->
          if next_token == :main_keyword do
            counter = counter+1
            parse_function(rest, counter)
          else
            {{:error, "Error, 2", num_line, next_token}, rest}
          end
        2->
          if next_token == :open_paren do
            counter = counter+1
            parse_function(rest, counter)
          else
            {{:error, "Error, 3 ",num_line, next_token},rest}
          end
        3->
          if next_token == :close_paren do
            counter = counter+1
            parse_function(rest,counter)
          else
            {{:error, "Error, 4 ",num_line,next_token},rest}
          end
        4->
          if next_token == :open_brace do
            statement = parse_statement(rest)
            case statement do
              {{:error, error_message,num_line, next_token}, rest} ->
                {{:error, error_message,num_line, next_token}, rest}

              {statement_node, list_rest} ->
                [{next_token, num_line} | rest] = list_rest
                if next_token == :close_brace do
                  {%AST{node_name: :function, value: :main, left_node: statement_node}, rest}
                else
                  {{:error, "Error 5", num_line, next_token}, rest}
                end
            end
          end
        end
      else
        {{:error, "Error, 6", num_line, next_token}, []}
      end
  end

  def parse_statement([{next_token, num_line} | rest]) do
      if next_token == :return_keyword do
        expression = parse_expression(rest)
        case expression do
          {{:error, error_message,num_line,next_token}, rest} ->
            {{:error, error_message,num_line,next_token}, rest}

          {exp_node, list_rest} ->
            [{next_token, num_line}|rest] = list_rest
            if next_token == :semicolon do
              {%AST{node_name: :return, left_node: exp_node}, rest}
            else
              {{:error, "Error: 7", num_line, next_token}, rest}
            end
        end
      else
        {{:error, "Error: 8", num_line, next_token}, rest}
      end
    end
  def parse_expression([next_token | rest]) do
    case next_token do
      {:constant, value} -> {%AST{node_name: :constant, value: value}, rest}
      _ -> {{:error, "Error: constant value missed"}, rest}
    end
  end

end

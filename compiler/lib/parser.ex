defmodule Parser do
  def init_parse(token_list, flag) do
   result = evaluator_lexer(token_list)
   if result == [] do
   astTree = token_list
   output = parse_function(astTree,0)
   case output do
      {{:error, error_message, line, problema}, _rest} -> print_error({:error, error_message, line, problema})
      {function_node, rest} -> parsing_flag(%AST{node_name: :program, left_node: function_node}, flag)
    end
    else
      IO.puts("Lexical Error:")
      [_,word_error,line] = result
      error_line = to_string(line+1)
      error_message = "Error: " <> error_line <> ":is not expected: " <> word_error
      {:error, error_message}
    end
  end

  def parse_function([{next_token, num_line}| rest], counter) do
    IO.inspect(next_token)
    if rest != [] do
      case counter do
        0->
          if next_token == :int_keyword do
            counter = counter+1
            parse_function(rest, counter)
          else
            {{:error, "Error 1" , num_line , next_token},rest}
          end
        1->
          if next_token == :main_keyword do
            counter = counter+1
            parse_function(rest, counter)
          else
            {{:error, "Error 2", num_line, next_token}, rest}
          end
        2->
          if next_token == :open_paren do
            counter = counter+1
            parse_function(rest, counter)
          else
            {{:error, "Error 3 ", num_line, next_token},rest}
          end
        3->
          if next_token == :close_paren do
            counter = counter+1
            parse_function(rest, counter)
          else
            {{:error, "Error 4 ", num_line, next_token},rest}
          end
        4->
          if next_token == :open_brace do
            statement = parse_statement(rest)

            case statement do
              {{:error, error_message, num_line, next_token}, rest} ->
                {{:error, error_message, num_line, next_token}, rest}

              {statement_node, [{next_token, num_line} | rest]} ->
                if next_token == :close_brace do
                  {%AST{node_name: :function, value: :main, left_node: statement_node}, rest}
                else
                  {{:error, "Error, close brace missed in line", num_line, next_token}, rest}
                end
            end
          end
        end
      else
        {{:error, "Error, close brace missed in line", num_line, next_token}, []}
      end
  end

    def parse_statement([{next_token, num_line} | rest]) do
    if next_token == :return_keyword do
      expression = parse_expression(rest)

      case expression do
        {{:error, error_message, num_line, next_token}, rest} ->
          {{:error, error_message, num_line, next_token}, rest}

        {exp_node, [{next_token,num_line} | rest]} ->
          if next_token == :semicolon do
            {%AST{node_name: :return, left_node: exp_node}, rest}
          else
            {{:error, "Error: semicolon missed after constant to finish return statement in line", num_line, next_token}, rest}
          end
      end
    else
      {{:error, "Error: return keyword missed in line", num_line, next_token}, rest}
    end
  end

 def parse_expression([{next_token, num_line} | rest]) do
    logical_and_expression = parse_logical_and_expression([{next_token, num_line} | rest])
    {expression_node, logical_and_expression_rest} = logical_and_expression
    [{next_token, num_line} | rest] = logical_and_expression_rest
    case next_token do
      :or_operator ->
          subTree = %AST{node_name: :or_op}
          parse_op = parse_logical_and_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      _ -> 
        logical_and_expression
    end
  end

 def parse_logical_and_expression([{next_token, num_line} | rest]) do
    equality_expression = parse_equality_expression([{next_token, num_line} | rest])
    {expression_node, equality_expression_rest} = equality_expression
    [{next_token, num_line} | rest] = equality_expression_rest
    case next_token do
      :and_operator ->
          subTree = %AST{node_name: :and_op}
          parse_op = parse_equality_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      _ -> 
        equality_expression
    end
  end

 def parse_equality_expression([{next_token, num_line} | rest]) do
    relational_expression = parse_relational_expression([{next_token, num_line} | rest])
    {expression_node, relational_expression_rest} = relational_expression
    [{next_token, num_line} | rest] = relational_expression_rest
    case next_token do
      :not_equal_operator ->
          subTree = %AST{node_name: :not_equal}
          parse_op = parse_relational_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      :equal_operator -> 
          subTree = %AST{node_name: :equal}
          parse_op = parse_relational_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      _ -> 
        relational_expression
    end
  end

  def parse_relational_expression([{next_token, num_line} | rest]) do
    additive_expression = parse_additive_expression([{next_token, num_line} | rest])
    {expression_node, additive_expression_rest} = additive_expression
    [{next_token, num_line} | rest] = additive_expression_rest
    case next_token do
      :less_than_operator ->
          subTree = %AST{node_name: :less_than}
          parse_op = parse_additive_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      :greater_than_operator -> 
          subTree = %AST{node_name: :greater_than}
          parse_op = parse_additive_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      :less_than_or_equal_operator ->
          subTree = %AST{node_name: :less_than_or_equal}
          parse_op = parse_additive_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      :greater_than_or_equal_operator -> 
          subTree = %AST{node_name: :greater_than_or_equal}
          parse_op = parse_additive_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      _ -> 
        additive_expression
    end
  end

 def parse_additive_expression([{next_token, num_line} | rest]) do
    term = parse_term([{next_token, num_line} | rest])
    {expression_node, term_rest} = term
    [{next_token, num_line} | rest] = term_rest
    case next_token do
      :add_operator ->
          subTree = %AST{node_name: :addition}
          parse_op = parse_term(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      :neg_operator -> 
          subTree = %AST{node_name: :substraction}
          parse_op = parse_term(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      _ -> 
        term
    end
  end

  def parse_term([{next_token, num_line} | rest]) do
    factor = parse_factor([{next_token, num_line} | rest])
    {expression_node, factor_rest} = factor
    [{next_token, num_line} | rest] = factor_rest
    case next_token do
      :mult_operator ->
          subTree = %AST{node_name: :multiplication}
          parse_op = parse_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      :div_operator -> 
          subTree = %AST{node_name: :division}
          parse_op = parse_expression(rest)
          {node,parse_rest} = parse_op
          [{next_token,num_line} | rest_op] = parse_rest
          {%{subTree | left_node: expression_node , right_node: node}, parse_rest}
      _ -> 
        factor
    end
  end

  def parse_factor([{next_token, num_line} | rest]) do
    case next_token do
      :open_paren ->  
        if next_token == :open_paren do
          expression = parse_expression(rest)
          case expression do
              {{:error, error_message, num_line, next_token}, rest} ->
                  {{:error, error_message, num_line, next_token}, rest}

              {exp_node, [{next_token,num_line} | rest]} ->
                  if next_token == :close_paren do
                    {exp_node, rest}
                  else
                    express = parse_expression(rest)
                    {node_expression,exp_rest} = expression
                    {node,[{next_token,num_line} | rest]} = exp_rest
                    {%AST{node_expression | left_node: node}, rest}
                  end
          end
        else
          {{:error, "Error: factor '(' ",num_line,next_token}, rest}
        end
        :neg_operator ->  
          parse_unary_op([{next_token, num_line} | rest])
        :bitwise_operator -> 
          parse_unary_op([{next_token, num_line} | rest])
        :logical_neg_operator ->
          parse_unary_op([{next_token, num_line} | rest])
        {:constant, value} -> 
          {%AST{node_name: :constant, value: value}, rest}
        _ -> 
          {{:error, "Error: incomplete factor", num_line, next_token}, rest}
    end    
  end

  def parse_unary_op([{next_token, num_line}| rest]) do
    case next_token do
      :neg_operator ->  
        if (hd rest) == {:neg_operator, num_line} do
          error_message =  "Error: can´t handle multiple operator in line"
          {{:error, error_message}, rest}
        else
          parse_unary = parse_factor(rest)
          {function_node,rest} = parse_unary
          case parse_unary do
            {{:error, error_message}, rest} -> 
              {{:error, error_message}, rest}
             _ -> 
                {%AST{node_name: :negation, left_node: function_node}, rest}
          end
        end
      :bitwise_operator ->
        parse_unary = parse_factor(rest)
        {function_node,rest} = parse_unary
        case parse_unary do
          {{:error, error_message}, rest} -> 
              {{:error, error_message}, rest}
          _ -> 
              {%AST{node_name: :bitwise, left_node: function_node}, rest}
        end   
      :logical_neg_operator ->
        parse_unary = parse_factor(rest)
        {function_node,rest} = parse_unary
        case parse_unary do
          {{:error, error_message}, rest} -> 
              {{:error, error_message}, rest}
          _ -> 
              {%AST{node_name: :logical_negation, left_node: function_node}, rest}      
        end   
    end
  end

  defp print_error (astTree) do
    {_,_,error_line,atom} = astTree
    error_line = to_string(error_line+1)
    error_reason = to_string(atom)
    error_message = "Error:  " <> error_line <> " : "<> error_reason
    {:error, error_message}
  end

    def parsing_flag(ast, flag) do
      if flag == :show_ast do
        IO.inspect(ast)
        {:ast, ast}
      else
        {:ok, ast}
      end
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
end
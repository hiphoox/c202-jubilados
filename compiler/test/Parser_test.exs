defmodule ParserTest do
	use ExUnit.Case
	doctest Parser

	setup_all do
		{:ok,
		ast: Parser.init_parse([
  			{:int_keyword, 0},
  			{:main_keyword, 0},
  			{:open_paren, 0},
  			{:close_paren, 0},
  			{:open_brace, 0},
  			{:return_keyword, 1},
  			{{:constant, 2}, 1},
  			{:semicolon, 1},
  			{:close_brace, 2}
		], :no_output),

    ast0: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {{:constant, 100}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

    ast_unary_op1: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:neg_operator, 1},
        {{:constant, 5}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

     ast_unary_op2: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:bitwise_operator, 1},
        {{:constant, 0}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

     ast_unary_op3: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:logical_neg_operator, 1},
        {{:constant, 12}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

     ast_unary_op4: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:logical_neg_operator, 1},
        {:neg_operator, 1},
        {{:constant, 3}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

      ast_unary_op5: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:logical_neg_operator, 1},
        {:bitwise_operator, 1},
        {{:constant, 0}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

      ast_unary_op6: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:bitwise_operator, 1},
        {:neg_operator, 1},
        {:logical_neg_operator, 1},
        {{:constant, 1000}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

      ast_unary_op7: Parser.init_parse([
        {:int_keyword, 0},
        {:main_keyword, 0},
        {:open_paren, 0},
        {:close_paren, 0},
        {:open_brace, 0},
        {:return_keyword, 1},
        {:logical_neg_operator, 1},
        {:bitwise_operator, 1},
        {:neg_operator, 1},
        {:logical_neg_operator, 1},
        {:logical_neg_operator, 1},
        {:bitwise_operator, 1},
        {:neg_operator, 1},
        {:bitwise_operator, 1},
        {:neg_operator, 1},
        {:bitwise_operator, 1},
        {:neg_operator, 1},
        {:bitwise_operator, 1},
        {{:constant, 666}, 1},
        {:semicolon, 1},
        {:close_brace, 2}
    ], :no_output),

      ast_unary_op8: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 4}, 1},
      {:neg_operator, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

      ast_unary_op9: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_unary_op10: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:neg_operator, 1},
      {:neg_operator, 1},
      {{:constant, 5}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output)}
  end
  
    #Test_to_pass

	  test "Test 1. return 2", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast]
  end

  test "Test 2. Multi Digit", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 100}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast0]
  end

  test "Test 3. Spaces", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast]
  end

  test "Test 4. Negation Five", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:neg_operator, 1},
      {{:constant, 5}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op1]
  end  

  test "Test 5. Bitwise Zero", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:bitwise_operator, 1},
      {{:constant, 0}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op2]
  end  

  test "Test 6. Logical Negation Twelve", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:logical_neg_operator, 1},
      {{:constant, 12}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op3]
  end  

   test "Test 7. Logical_Neg and Negation Three", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:logical_neg_operator, 1},
      {:neg_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op4]
  end  

  test "Test 8. Logical_Neg and Bitwise", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:logical_neg_operator, 1},
      {:bitwise_operator, 1},
      {{:constant, 0}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op5]
  end  

  test "Test 9. Mult Operator", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:bitwise_operator, 1},
      {:neg_operator, 1},
      {:logical_neg_operator, 1},
      {{:constant, 1000}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op6]
  end  

  test "Test 10. Mult Operator 2", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:logical_neg_operator, 1},
      {:bitwise_operator, 1},
      {:neg_operator, 1},
      {:logical_neg_operator, 1},
      {:logical_neg_operator, 1},
      {:bitwise_operator, 1},
      {:neg_operator, 1},
      {:bitwise_operator, 1},
      {:neg_operator, 1},
      {:bitwise_operator, 1},
      {:neg_operator, 1},
      {:bitwise_operator, 1},
      {{:constant, 666}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op7]
  end  

  #Test_to_Failed
  test "Test 11. Negation wrong order", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 4}, 1},
      {:neg_operator, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op8]
  end  

  test "Test 12. Mising ret_val", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:neg_operator, 1},
      {:neg_operator, 1},
      {{:constant, 5}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_unary_op10]
  end  
end
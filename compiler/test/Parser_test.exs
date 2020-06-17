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
      ], :no_output),

       ast_binary_op: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:add_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),


       ast_binary_op1: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:neg_operator, 1},
      {{:constant, 2}, 1},
      {:neg_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op2: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 6}, 1},
      {:div_operator, 1},
      {{:constant, 3}, 1},
      {:div_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op3: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 4}, 1},
      {:div_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op4: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:neg_operator, 1},
      {{:constant, 12}, 1},
      {:div_operator, 1},
      {{:constant, 5}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op5: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:mult_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op6: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:mult_operator, 1},
      {{:constant, 3}, 1},
      {:add_operator, 1},
      {{:constant, 4}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op7: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 4}, 1},
      {:mult_operator, 1},
      {{:constant, 5}, 1},
      {:add_operator, 1},
      {{:constant, 6}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op8: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:neg_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

      ast_binary_op9: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:neg_operator, 1},
      {:neg_operator, 1},
      {{:constant, 1}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

      ast_binary_op10: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:bitwise_operator, 1},
      {{:constant, 2}, 1},
      {:add_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

      ast_binary_op11: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:bitwise_operator, 1},
      {{:constant, 1}, 1},
      {:add_operator, 1},
      {{:constant, 1}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op12: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:open_paren, 1},
      {:neg_operator, 1},
      {{:constant, 1}, 1},
      {:close_paren, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),

       ast_binary_op13: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:div_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),


       ast_binary_op14: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:add_operator, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output),


       ast_binary_op15: Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:mult_operator, 1},
      {{:constant, 2}, 1},
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

  test "Test 11. Suma", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:add_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op]
  end  

  test "Test 12. Resta", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:neg_operator, 1},
      {{:constant, 2}, 1},
      {:neg_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op1]
  end  

   test "Test 13. Div_1", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 6}, 1},
      {:div_operator, 1},
      {{:constant, 3}, 1},
      {:div_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op2]
  end  

   test "Test 14. Div_2", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 4}, 1},
      {:div_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op3]
  end  

   test "Test 15. Div_Neg", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:neg_operator, 1},
      {{:constant, 12}, 1},
      {:div_operator, 1},
      {{:constant, 5}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op4]
  end  

  test "Test 16. Multi", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:mult_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op5]
  end  

  test "Test 17. Varias_Op", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:mult_operator, 1},
      {{:constant, 3}, 1},
      {:add_operator, 1},
      {{:constant, 4}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op6]
  end  

   test "Test 18. Precedence", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 4}, 1},
      {:mult_operator, 1},
      {{:constant, 5}, 1},
      {:add_operator, 1},
      {{:constant, 6}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op7]
  end  

  test "Test 19. Sub", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:neg_operator, 1},
      {{:constant, 2}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op8]
  end  

  test "Test 20. Sub_neg", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:neg_operator, 1},
      {:neg_operator, 1},
      {{:constant, 1}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op9]
  end  

  test "Test 21. Bit_add", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:bitwise_operator, 1},
      {{:constant, 2}, 1},
      {:add_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op10]
  end  

  test "Test 22. Paren_Bit_add", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:bitwise_operator, 1},
      {{:constant, 1}, 1},
      {:add_operator, 1},
      {{:constant, 1}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op11]
  end  

  #Test_to_Failed

  test "Test 23. Negation wrong order", state do
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

  test "Test 24. Mising ret_val", state do
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

    test "Test 25. Mal_paren", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:open_paren, 1},
      {:neg_operator, 1},
      {{:constant, 3}, 1},
      {:close_paren, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op12]
  end  

   test "Test 26. Missing_first_op", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {:div_operator, 1},
      {{:constant, 3}, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op13]
  end  

    test "Test 27. Missing_second_op", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 1}, 1},
      {:add_operator, 1},
      {:semicolon, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op14]
  end  

   test "Test 28. No_semicolon", state do
    assert Parser.init_parse([
      {:int_keyword, 0},
      {:main_keyword, 0},
      {:open_paren, 0},
      {:close_paren, 0},
      {:open_brace, 0},
      {:return_keyword, 1},
      {{:constant, 2}, 1},
      {:mult_operator, 1},
      {{:constant, 2}, 1},
      {:close_brace, 2}
      ], :no_output) == state[:ast_binary_op15]
  end  
end
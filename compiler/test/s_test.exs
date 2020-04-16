defmodule ScannerTest do
  use ExUnit.Case
  doctest Scanner

  setup_all do
    {:ok,
     tokens: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1}, 
     {{:constant, 0}, 1}, 
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens0: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1}, 
     {{:constant, 100}, 1}, 
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens1: {:ok,[
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
     ]},

     tokens2: {:ok,[
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
     ]},

     tokens3: {:ok,[
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
     ]},

     tokens4: {:ok,[
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
     ]},

     tokens5: {:ok,[
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
     ]},

     tokens6: {:ok,[
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
     ]},

     tokens7: {:ok,[
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
     ]},
     }
    end
    
    #Test_to_pass
    test "Test 1. return 0", state do
    code = """
    	int main() {
    		return 0;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens]
  end

   test "Test 2. Multi Digit", state do
    code = """
    	int main() {
    		return 100;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens]
  end

  test "Test 3. Spaces", state do
    code = """
    	   int                    main           (            )         {   
       			return             2           ; 
    		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens]
  end

  test "Test 4. Negation Five", state do
    code = """
    	int main() {
    		return -5;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens1]
  end

  test "Test 5. Bitwise Zero", state do
    code = """
    	int main() {
    		return ~0;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens3]
  end

  test "Test 6. Logical Negation Twelve", state do
    code = """
    	int main() {
    		return !12;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens2]
  end

   test "Test 7. Logical_Neg and Negation Three", state do
    code = """
    	int main() {
    		return !-3;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens4]
  end

  test "Test 8. Logical_Neg and Bitwise Zero", state do
    code = """
    	int main() {
    		return !~0;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens5]
  end

  test "Test 9. Mult Operator", state do
    code = """
    	int main() {
    		return ~ -! 1000;
		}

    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens6]
  end

  test "Test 10. Mult Operator 2", state do
    code = """
    	int main() {
    		return ! ~ -!! ~ -~ -~ -~666;
		}

    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens7]
  end

  #Test_to_failed

  test "Test 11. No Space", state do
    code = """
     int main() {
        return0;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] 
  end

   test "Test 12. Negation wrong order", state do
    code = """
     	int main() {
    		return 4-;
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens1]
  end

   test "Test 13. Missing close brace ", state do
    code = """
     	int main {
    		return 0;
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens]

  test "Test 14. Missing open paren", state do
    code = """
     	int main( {
    		return 0;
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens]
  end

  test "Test 15. Missing retval", state do
    code = """
     	int main() {
    		return;
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or
  end

  test "Test 16. Missing semicolon", state do
    code = """
     	int main() {
    		return 0
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test 17. Missing constant", state do
    code = """
     	int main() {
    		return !;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test 18. Operator, constant, operator", state do
    code = """
     	int main() {
    		return !12-;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test 19. Operator between two constant", state do
    code = """
     	int main() {
    		return 12!12;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end


  test "Test 20. Double Negation", state do
    code = """
    	int main() {
    		return --5;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens1] 
  end  
end
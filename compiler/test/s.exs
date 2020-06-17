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

     tokens8: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1},  
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens9: {:ok,[
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
     ]},

     tokens10: {:ok,[
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
     ]},

     tokens11: {:ok,[
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
     ]},

     tokens12: {:ok,[
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
     ]},

     tokens13: {:ok,[
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
     ]},

     tokens14: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1},
     {:open_paren, 1},
     {:neg_operator, 1}, 
     {{:constant, 12}, 1},
     {:close_paren, 1},
     {:div_operator, 1},
     {{:constant, 5}, 1}, 
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens15: {:ok,[
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
     ]},

     tokens16: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1}, 
     {{:constant, 2}, 1},
     {:mult_operator, 1},
     {:open_paren, 1},
     {{:constant, 3}, 1}, 
     {:add_operator, 1},
     {{:constant, 4}, 1},
     {:close_paren, 1},
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens17: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1}, 
     {{:constant, 2}, 1},
     {:add_operator, 1},
     {{:constant, 3}, 1}, 
     {:mult_operator, 1},
     {{:constant, 4}, 1},
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens18: {:ok,[
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
     ]},

     tokens19: {:ok,[
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
     ]},

     tokens20: {:ok,[
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
     ]},

     tokens21: {:ok,[
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1}, 
     {:bitwise_operator, 1},
     {:open_paren, 1},
     {{:constant, 1}, 1},
     {:add_operator, 1},
     {{:constant, 1}, 1},
     {:close_paren, 1},
     {:semicolon, 1},
     {:close_brace, 2}
     ]},

     tokens22: {:ok,[
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
     ]},

     tokens23: {:ok,[
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
     ]},

     tokens24: {:ok,[
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
     ]},

     tokens25: {:ok,[
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
     ]}

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
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens0]
  end

  test "Test 3. Spaces", state do
    code = """
    	   int                    main           (            )         {   
       			return             0           ; 
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

  test "Test 11. Suma", state do
    code = """
        int main() {
            return 1 + 2;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens10] 
  end  

 test "Test 12. Resta", state do
    code = """
        int main() {
            return 1 - 2 - 3;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens11] 
  end  

  test "Test 13. Div_1", state do
    code = """
        int main() {
            return 6 / 3 / 2;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens12] 
  end  

   test "Test 14. Div_2", state do
    code = """
        int main() {
            return 4 / 2;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens13] 
  end  

  test "Test 15. Div_Neg", state do
    code = """
        int main() {
          return (-12) / 5;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens14] 
  end  

  test "Test 16. Multi", state do
    code = """
        int main() {
            return 2 * 3;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens15] 
  end  

  test "Test 17. Varias_Op", state do
    code = """
        int main() {
            return 2 * (3 + 4);
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens16] 
  end  

  test "Test 18. Precendence", state do
    code = """
        int main() {
            return 2 + 3 * 4;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens17] 
  end  

   test "Test 19. Sub", state do
    code = """
        int main() {
            return 1 - 2;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens18] 
  end  

  test "Test 20. Sub_neg", state do
    code = """
        int main() {
            return 2- -1;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens19] 
  end  

  test "Test 21. Bit_add", state do
    code = """
        int main() {
            return ~2 + 3;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens20] 
  end  

  test "Test 22. Paren_Bit_Add", state do
    code = """
        int main() {
           return ~(1 + 1);
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens21] 
  end  

  #Test_to_failed

  test "Test 23. No Space", state do
    code = """
     int main() {
        return0;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] 
  end

   test "Test 24. Negation wrong order", state do
    code = """
     	int main() {
    		return 4-;
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens1]
  end

  test "Test 25. Missing retval", state do
    code = """
     	int main() {
    		return;
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens8]
  end

  test "Test 26. Missing semicolon", state do
    code = """
     	int main() {
    		return 0
    	}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test 27. Missing constant", state do
    code = """
     	int main() {
    		return !;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test 28. Operator, constant, operator", state do
    code = """
     	int main() {
    		return !12-;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test 29. Operator between two constant", state do
    code = """
     	int main() {
    		return 12!12;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end


  test "Test 30. Double Negation", state do
    code = """
    	int main() {
    		return --5;
		}
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens9] 
  end  
  

  test "Test 31. Mal_Paren", state do
    code = """
        int main() {
            return 2 (- 3);
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens22] 
  end  

  test "Test 32. Missing_first_op", state do
    code = """
        int main() {
            return /3;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens23] 
  end  

  test "Test 33. Missing_second_op", state do
    code = """
       int main() {
        return 1 + ;
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens24] 
  end  

  test "Test 34. No_semicolon", state do
    code = """
       int main() {
        return 2*2
        }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens25] 
  end  
end
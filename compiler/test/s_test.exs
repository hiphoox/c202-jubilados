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
     ]}
     }
    end
     test "Test. return 0", state do
    code = """
     int main() {
        return !5
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end

  test "Test. 2invalid", state do
    code = """
     int main() {
        return0;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] 
  end
   test "Test. 3invalid", state do
    code = """
     int main() {
    return 4-;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
   test "Test. 4invalid", state do
    code = """
     int main {
    return 0;
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
  test "Test. 5invalid", state do
    code = """
     int main( {
    return 0;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
  test "Test. 6invalid", state do
    code = """
     int main() {
    return;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
  test "Test. 7invalid", state do
    code = """
     int main() {
    return 0
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
  test "Test. 8invalid", state do
    code = """
     int main() {
    return0;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
  test "Test. 9invalid", state do
    code = """
     int main() {
    RETURN 0;
    }
    """
    s_code = Compiler.clean_code(code) 
    assert Scanner.start_scan(s_code, :no_output) == state[:tokens] or state[:tokens2]
  end
end
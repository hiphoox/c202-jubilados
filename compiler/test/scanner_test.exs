defmodule ScannerTest do
	use ExUnit.Case
	doctest Scanner
	
setup_all do
    {:ok,
     tokens: [
     {:int_keyword, 0}, 
     {:main_keyword, 0}, 
     {:open_paren, 0}, 
     {:close_paren, 0}, 
     {:open_brace, 0}, 
     {:return_keyword, 1}, 
     {{:constant, 2}, 1}, 
     {:semicolon, 1},
      {:close_brace, 2}
     ]}
  end
	
	## Test
	## Valid
  test "return 10", state do
    code = """
      int main() {
           return 2;
    }
    """

    s_code = Compiler.clean_code(code) 
    assert Scanner.scan_words(s_code) == state[:tokens]
  end	


end
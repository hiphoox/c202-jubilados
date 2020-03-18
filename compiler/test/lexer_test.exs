defmodule LexerTest do
	use ExUnit.Case
	doctest Parser
	
	setup_all do
		{:ok,
		  tokens:[
			{:int_keyword, 0},
			{:main_keyword, 0},
			{:open_paren, 0},
			{:close_paren, 0},
			{:open_brace, 0},
			{:return_keyword, 0},
			{{:constant, 0},0}
			{:semicolon, 0},
			{:close_brace, 0}
		]}
	end
	
	## Test
	## Valid
	test "spacetest", state do
		code = """"""
			int  main    ()   {   return     0;}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end
	
	test "return 0", state do
		code = """"""
			int main() {
				return 0;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens])
	end		
	
	test "return 2", state do
		code = """"""
			int main() {
				return 2;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end		
	
	test "newlines_no", state do
		code = """"""
			int main(){return 0;}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end		
	
	test "new_lines", state do
		code = """"""
			int
			main
			(
			)
			{
			return
			0
			;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end		
	
	test "multi_digit", state do
		code = """"""
			int main() {
				return 100;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end	

	## Test
	## Invalid
	test "wrong_case", state do
		code = """"""
			int main() {
				RETURN 0;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end
	
	test "no_space", state do
		code = """"""
			int main() {
				return0;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Parser.parser_program == state (token_list)
	end		
	
	test "no_semicolon", state do
		code = """"""
			int main() {
				return 0
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end		
	
	test "no_brace", state do
		code = """"""
			int main {
				return 0;
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end		
	
	test "missing_retval", state do
		code = """"""
			int main() {
				return;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end		
	
	test "missing_parent", state do
		code = """"""
			int main( {
				return 0;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Lexer.scan_words(s_code) == state[:tokens]
	end
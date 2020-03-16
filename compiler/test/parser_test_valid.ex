defmodule ParserTest do
	use ExUnit.Case
	doctest Parser
	
	setup_all do
		{:ok,
		arbol: Parser.parser_program([
			{:int_keyword, 0},
			{main_keyword, 0},
			{:open_paren, 0},
			{:close_paren, 0},
			{:open_brace, 0},
			{:return_keyword, 0},
			{{:constant, 0},0}
			{:semicolon, 0},
			{:close_brace, 0}
		])}
	end
	
	## Parser Test
	## Valid
	test "spacetest", state do
		code = """"""
			int  main    ()   {   return     0;}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Parser.parser_program == state (token_list)
	end
	
	test "return 0", state do
		code = """"""
			int main() {
				return 0;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Parser.parser_program == state (token_list)
	end		
	
	test "return 2", state do
		code = """"""
			int main() {
				return 2;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Parser.parser_program == state (token_list)
	end		
	
	test "newlines_no", state do
		code = """"""
			int main(){return 0;}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Parser.parser_program == state (token_list)
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
			assert Parser.parser_program == state (token_list)
	end		
	
	test "multi_digit", state do
		code = """"""
			int main() {
				return 100;
			}
			""""""
			s_code = Scanner.scanner_program(code)
			assert Parser.parser_program == state (token_list)
	end		
end	
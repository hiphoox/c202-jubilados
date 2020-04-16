defmodule CodeGenerator do
  def generate_code(astTree, flag, path) do
    if is_map(astTree) do
      code = post_order(astTree)
      parsing_flag(code, flag)
  else 
      IO.puts("Syntax Error")
      {_,_,error_line,atom} = astTree
      error_line = to_string(error_line+1)
      error_reason = to_string(atom)
      error_message = "Error:  " <> error_line <> " : "<> error_reason
      {:error, error_message}
    end
  end

  def post_order(node) do
    case node do
      nil ->
        nil
      ast_node ->
        code_snippet = post_order(ast_node.left_node)
        post_order(ast_node.right_node)
        emit_code(ast_node.node_name, code_snippet, ast_node.value)
    end
  end

  def emit_code(:program, code_snippet, _) do
    """
        .section        __TEXT,__text,regular,pure_instructions
        .p2align        4, 0x90
    """ <>
      code_snippet
  end

  def emit_code(:function, code_snippet, :main) do
    """
        .globl  _main         ## -- Begin function main
    _main:                    ## @main
    """ <>
      code_snippet
  end

  def emit_code(:return, code_snippet, _) do
    """
        movl    #{code_snippet}, %eax
        ret
    """
  end

  def emit_code(:negation, code_snippet, _) do
    code_snippet <>
      """
          neg	%eax
      """
  end

  def emit_code(:bitwise, code_snippet, _) do
    code_snippet <>
      """
          not	%eax
      """
  end

  def emit_code(:logical_negation, code_snippet, _) do
    code_snippet <>
      """
      cmpl      #{code_snippet}, %eax
      movl      #{code_snippet}, %eax
      sete     %al
      """
  end

  def emit_code(:constant, _code_snippet, value) do
    "$#{value}"
  end

  def parsing_flag(asm, flag) do
    if flag == :show_asm do
      IO.puts("\nCode Generator output:")
      IO.puts(asm)
      {:asm, asm}
    else
      IO.puts("\nCode  output:")
      IO.puts(asm)
      {:ok, asm}
    end
  end

end
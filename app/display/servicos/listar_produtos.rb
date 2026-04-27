require 'terminal-table'

def listar_produtos
  if ProdutoServico.todos.empty?
    mensagem_vermelha 'Você ainda não possui produtos cadastrados para visualizar.', true, true
    return
  end

  limpar_tela
  imprimir_tabela
  sleep 10 
  limpar_tela
end
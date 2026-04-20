require_relative '../display/operacoes_de_tela'
require 'terminal-table'

def listar_produtos(produtos)
  if produtos.empty?
    mensagem_vermelha 'Você ainda não possui produtos cadastrados para visualizar.', true, true
    return
  end

  limpar_tela
  imprimir_tabela(produtos)
  sleep 10 
  limpar_tela
end
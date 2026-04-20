require_relative '../core/cadastrar_produto'
require_relative '../core/listar_produtos'
require_relative '../core/retirar_produto'

def iniciar_menu(produtos=[])
  loop do
    mensagem_amarela 'Escolha uma das opções abaixo:', false, false
    mensagem_amarela '1. Cadastro de Produtos', false, false
    mensagem_amarela '2. Lista de Produtos', false, false
    mensagem_amarela '3. Retirar do Estoque', false, false
    mensagem_amarela '4. Sair', false, false

    opcao = gets.to_i
    case opcao
    when 1
      cadastrar_produto(produtos)
    when 2
      listar_produtos(produtos)
    when 3
      retirar_produto(produtos)
    when 4
      mensagem_vermelha 'Encerrando o programa...', true, true
      exit 1
    else
      mensagem_vermelha 'Opção inválida...'
    end
  end
rescue Interrupt
  mensagem_vermelha 'Programa interrompido. Encerrando programa...'
  exit 1
end

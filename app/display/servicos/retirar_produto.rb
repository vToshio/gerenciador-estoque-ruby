def retirar_produto
  if ProdutoServico.todos.empty?
    mensagem_vermelha 'Você ai  nda não possui produtos cadastrados para remover.'
    return
  end

  mensagem_verde 'Retirada de Produtos'

  imprimir_tabela
  mensagem 'Insira o ID do produto: ', false, false
  id = gets.chomp.to_i

  produto = ProdutoServico.todos.find { |p| p.id == id }
  if produto.nil?
    mensagem_vermelha "O produto com ID #{id} não foi encontrado."
  else
    if produto.sem_estoque?
      mensagem_vermelha "O produto #{produto.nome} está sem estoque."
      return
    end

    limpar_tela
    mensagem "#{amarelo('Produto selecionado:')} #{produto.nome}", false, false
    mensagem "#{amarelo('Quantidade atual:')} #{produto.qtd_estoque}", false, false
    mensagem 'Insira quantos produtos deseja retirar: ', false, false
    quantidade = gets.chomp.to_i

    unless produto.retirar?(quantidade)
      mensagem_vermelha 'Quantidade insuficiente no estoque.'

      mensagem 'Deseja retirar produtos novamente?'
      opcao = gets.chomp
      retirar_produto(produtos) if %w[s S sim Sim SIM].include?(opcao)
      return
    end

    produto.retirar(quantidade)
    mensagem_verde 'Retirada realizada com sucesso!', true, true
  end
end

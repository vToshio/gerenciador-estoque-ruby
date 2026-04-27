def mensagem(conteudo, usar_limpar_tela = true, usar_timer = true, timer = 3)
  limpar_tela if usar_limpar_tela
  puts conteudo
  sleep timer if usar_timer 
  limpar_tela if usar_limpar_tela
end

def mensagem_vermelha(texto, usar_limpar_tela = true, usar_timer = true)
  mensagem vermelho(texto), usar_limpar_tela, usar_timer
end

def mensagem_verde(texto, usar_limpar_tela = true, usar_timer = true)
  mensagem verde(texto), usar_limpar_tela, usar_timer
end

def mensagem_amarela(texto, usar_limpar_tela = true, usar_timer = true)
  mensagem amarelo(texto), usar_limpar_tela, usar_timer
end

def vermelho(texto)
  "\e[31m#{texto}\e[0m"
end

def verde(texto)
  "\e[32m#{texto}\e[0m"
end

def amarelo(texto)
  "\e[33m#{texto}\e[0m"
end

def imprimir_tabela(produtos)
  tabela = Terminal::Table.new do |t|
    t.title = 'Produtos'
    t.headings = ['ID', 'Nome do Produto', 'Descrição', 'Preço (R$)', 'Quantidade', 'Valor em Estoque']

    produtos.each do |produto|
      t.add_row [produto.id, produto.nome, produto.descricao, produto.preco, produto.qtd_estoque, produto.calcular_valor_total]
    end
  end
  puts tabela
end

def limpar_tela
  if Gem.win_platform?
    system 'cls'
  else
    system 'clear'
  end
end

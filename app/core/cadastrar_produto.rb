require_relative '../display/operacoes_de_tela'

def cadastrar_produto(produtos)
  mensagem_verde 'Iniciando cadastro de produtos', true, true

  mensagem 'Digite o nome do produto: ', false, false
  nome = gets.chomp.to_s
  limpar_tela

  mensagem "Digite a descrição do produto (#{verde(nome)}): ", false, false
  descricao = gets.chomp.to_s
  limpar_tela

  mensagem "Digite o preço do produto (#{verde(nome)}): ", false, false
  preco = gets.chomp.to_f
  limpar_tela

  mensagem "Digite a quantidade em estoque do produto (#{verde(nome)}): ", false, false
  qtd_estoque = gets.chomp.to_i
  limpar_tela

  produtos << {
    id: Time.now.to_i,
    nome: nome,
    descricao: descricao,
    preco: preco,
    qtd_estoque: qtd_estoque
  }
 
  mensagem "#{nome} cadastrado com sucesso!"
rescue TypeError
  mensagem_vermelha 'Tipo de dado incorreto. Cancelando cadastro de produto.', true, true
end

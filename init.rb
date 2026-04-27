require_relative 'app/display/menu'
require_relative 'app/display/operacoes_de_tela'
require_relative 'app/domain/entities/produto'


ProdutoServico.adicionar(
  Produto.new(
    nome: 'Tênis Nike',
    descricao: 'Verde',
    preco: 259.99,
    qtd_estoque: 25
  )
)

iniciar_menu
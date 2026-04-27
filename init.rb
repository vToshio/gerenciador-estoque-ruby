require_relative 'app/display/menu'
require_relative 'app/display/operacoes_de_tela'
require_relative 'app/domain/entities/produto'
require_relative 'app/domain/services/produto_servico'
require_relative 'infra/json_repositorio'
require 'byebug'

ProdutoServico.adicionar(
  Produto.new({
    id: Time.now.to_i,
    nome: 'Tênis Nike',
    descricao: 'Verde',
    preco: 259.99,
    qtd_estoque: 25
  })
) unless ProdutoServico.todos.find { |p| p.nome = 'Tênis Nike' }

iniciar_menu
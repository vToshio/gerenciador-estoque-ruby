class Produto
  attr_reader :id
  attr_accessor :nome, :descricao, :preco, :qtd_estoque

  def initialize(opts={})
    @id = opts[:id]
    @nome = opts[:nome]
    @descricao = opts[:descricao]
    @preco = opts[:preco]
    @qtd_estoque = opts[:qtd_estoque]
  end

  def sem_estoque?
    @qtd_estoque.zero?
  end

  def retirar?(quantidade)
    !sem_estoque? || quantidade <= @qtd_estoque
  end

  def retirar(quantidade)
    @qtd_estoque -= quantidade

    JsonRepositorio.atualizar(id, qtd_estoque)
  end

  def calcular_valor_total
    @qtd_estoque * @preco
  end
end

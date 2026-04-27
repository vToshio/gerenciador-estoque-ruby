class Produto
  attr_reader :id
  attr_accessor :nome, :descricao, :preco, :qtd_estoque

  def initialize(nome:, descricao:, preco:, qtd_estoque:)
    @id = Time.now.to_i
    @nome = nome
    @descricao = descricao
    @preco = preco
    @qtd_estoque = qtd_estoque
  end

  def sem_estoque?
    @qtd_estoque.zero?
  end

  def retirar?(quantidade)
    !sem_estoque? || quantidade <= @qtd_estoque
  end

  def retirar(quantidade)
    @qtd_estoque -= quantidade
  end

  def calcular_valor_total
    @qtd_estoque * @preco
  end
end

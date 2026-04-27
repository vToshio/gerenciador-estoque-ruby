class ProdutoServico
  @@produtos = []

  def self.todos
    @@produtos
  end

  def self.adicionar(produto = Produto.new)
    return if produto.nome.nil?
    
    @@produtos << produto
  end
end
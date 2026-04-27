class ProdutoServico
  def self.todos
    dados = JsonRepositorio.ler
    produtos = []
    dados.each do |dado|
      produtos << Produto.new(dado)
    end

    produtos
  end

  def self.adicionar(produto = Produto.new)
    return if produto.nome.nil?

    produto_hash = transformar_para_hash(produto)
    JsonRepositorio.adicionar(produto_hash)
  end

  private

  def self.transformar_para_hash(produto)
    produto.instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete('@')] = produto.instance_variable_get(var)
    end
  end
end
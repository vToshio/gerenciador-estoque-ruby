class ProdutoServico
  def initialize(repo, arquivo='')
    @repositorio = repo
    @arquivo = arquivo
  end

  def todos
    dados = @repositorio.ler(@arquivo)
    produtos = []
    dados.each do |dado|
      produtos << Produto.new(dado)
    end

    produtos
  end

  def adicionar(produto = Produto.new)
    return if produto.nome.nil?

    produto_hash = self.transformar_para_hash(produto)
    data = @repositorio.ler(@arquivo) || []
    data << produto_hash

    @repositorio.escrever(@arquivo, data)
  end

  def retirar(produto, qtd_retirada)
    produto.retirar(qtd_retirada)

    data = @repositorio.ler(@arquivo)
    obj = data.find { |d| d[:id] == produto.id }
    obj[:qtd_estoque] = produto.qtd_estoque

    @repositorio.escrever(@arquivo, data)
  end

  private

  def transformar_para_hash(produto)
    produto.instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete('@')] = produto.instance_variable_get(var)
    end
  end
end

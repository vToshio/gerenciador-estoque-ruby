class MenuServico
  def initialize(repo, arquivo='')
    @servico_produto = ProdutoServico.new(repo, arquivo)
  end

  def listar_produtos
    if @servico_produto.todos.empty?
      mensagem_vermelha 'Você ainda não possui produtos cadastrados para visualizar.', true, true
      return
    end

    limpar_tela
    imprimir_tabela(@servico_produto.todos)
    sleep 10
    limpar_tela
  end

  def cadastrar_produto
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

    @servico_produto.adicionar(
      Produto.new({
        id: Time.now.to_i,
        nome: nome,
        descricao: descricao,
        preco: preco,
        qtd_estoque: qtd_estoque
      })
    )

    mensagem "#{nome} cadastrado com sucesso!"
  rescue TypeError
    mensagem_vermelha 'Tipo de dado incorreto. Cancelando cadastro de produto.', true, true
  end

  def retirar_produto
    if @servico_produto.todos.empty?
      mensagem_vermelha 'Você ai  nda não possui produtos cadastrados para remover.'
      return
    end

    mensagem_verde 'Retirada de Produtos'

    imprimir_tabela(@servico_produto.todos)
    mensagem 'Insira o ID do produto: ', false, false
    id = gets.chomp.to_i

    produto = @servico_produto.todos.find { |p| p.id == id }
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
        retirar_produto if %w[s S sim Sim SIM].include?(opcao)
        return
      end

      @servico_produto.retirar(produto, quantidade)
      mensagem_verde 'Retirada realizada com sucesso!', true, true
    end
  end
end

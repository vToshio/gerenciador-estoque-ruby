require 'json'

class JsonRepositorio
  @arquivo = 'db/produtos.json'

  def self.ler
    unless File.exist?(@arquivo)
      puts "O arquivo #{@arquivo} não existe." 
      return nil
    end

    begin
      json_data = File.read(@arquivo)
      data = JSON.parse(json_data).map { |d| d.transform_keys(&:to_sym) }
      data
    rescue JSON::ParserError => e
      puts "Erro ao analisar arquivo JSON: #{e}"
    end
  end

  def self.escrever(data)
    unless File.exist?(@arquivo)
      puts "O arquivo #{@arquivo} não existe." 
      return nil
    end

    File.open(@arquivo, 'w') do |file|
      file.puts JSON.pretty_generate(data)
    end
  end

  def self.adicionar(obj)
    data = ler || []

    data << obj
    escrever(data)
  end

  def self.atualizar(id, qtd_estoque)
    data = ler || []
    return if data.empty?

    debugger
    obj = data.find { |d| d[:id] == id }
    obj[:qtd_estoque] = qtd_estoque
    
    escrever(data)
  end
end

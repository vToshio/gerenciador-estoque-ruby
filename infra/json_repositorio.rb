require 'json'

class JsonRepositorio
  def self.ler(arquivo)
    unless File.exist?(arquivo)
      puts "O arquivo #{arquivo} não existe." 
      return nil
    end

    begin
      json_data = File.read(arquivo)
      data = JSON.parse(json_data).map { |d| d.transform_keys(&:to_sym) }
      data
    rescue JSON::ParserError => e
      puts "Erro ao analisar arquivo JSON: #{e}"
    end
  end

  def self.escrever(arquivo, data)
    unless File.exist?(arquivo)
      puts "O arquivo #{arquivo} não existe." 
      return nil
    end

    File.open(arquivo, 'w') do |file|
      file.puts JSON.pretty_generate(data)
    end
  end
end

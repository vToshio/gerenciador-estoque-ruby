require_relative 'app/display/menu'
require_relative 'app/display/servicos/menu_servico'
require_relative 'app/display/operacoes_de_tela'
require_relative 'app/domain/entities/produto'
require_relative 'app/domain/services/produto_servico'
require_relative 'infra/json_repositorio'

require 'byebug'
require 'terminal-table'

db_file = 'db/produtos.json'
adapter = JsonRepositorio

iniciar_menu(adapter, db_file)
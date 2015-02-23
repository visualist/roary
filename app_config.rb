
require 'yaml'

module AppConfig
  Env      = ENV['ENV'] || 'development'
  Root     = File.expand_path '..', __FILE__
  Models   = Root + '/models/*.rb'
  DbConfig = YAML.load(File.read(File.join(Root, 'config/database.yml')))
end


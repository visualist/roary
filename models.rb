
require_relative 'app_config'
require 'logger'
require 'active_record'

ActiveRecord::Base.configurations = AppConfig::DbConfig
ActiveRecord::Base.establish_connection AppConfig::Env.to_sym
ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))
path = AppConfig::Models
Dir[path].each do |file| 
  require_relative File.join("models", File.basename(file, File.extname(file)))
end


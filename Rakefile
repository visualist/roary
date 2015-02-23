
# derived from http://stackoverflow.com/questions/19206764/how-can-i-load-activerecord-database-tasks-on-a-ruby-project-outside-rails
# and https://gist.github.com/drogus/6087979 ; AppConfig stuff added my me --wade 2/22/2015

require_relative 'app_config'
require 'logger'
require 'active_record'

include ActiveRecord::Tasks

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)
    load @seed_file
  end
end

root = AppConfig::Root
DatabaseTasks.env = AppConfig::Env
DatabaseTasks.database_configuration = AppConfig::DbConfig

DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.seed_loader = Seeder.new File.join root, 'db/seeds.rb'
DatabaseTasks.root = root

task :default => :environment

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'


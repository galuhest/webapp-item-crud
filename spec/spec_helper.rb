require "bundler/setup"
require 'rack/test'
require 'rspec'
require "dotenv/load"

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../item-crud.rb', __FILE__

# Module ini akan mengintegrasikan sinatra agar bisa di test
module RSpecMixin
  include Rack::Test::Methods
  # Function untuk mengintegrasikan sinatra
  def app() Sinatra::Application end
end

# Module ini digunakan untuk memanipulasi DB
# saat test dilakukan. 
module ItemDB
  # Memasukan user baru kedalam db untuk keperluan test
  def create_user(name)
    connection = Mysql.new(ENV['DB_HOST'], ENV["DB_USER"], ENV["DB_PASSWORD"], ENV["DATABASE"])
    item = connection.query("insert into item (name) values (\'#{name}\')")
    query = connection.query('SELECT LAST_INSERT_ID()') 
    id = -1
    query.each do |row|
      id = row
    end
    connection.close
    return "OK", id
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.include ItemDB
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!
  
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

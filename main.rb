require 'mini_magick'
require 'json'
require 'open-uri'
require 'fileutils'

require_relative 'classes/interface.rb'
require_relative 'classes/abstract_sql_database_provider.rb'
require_relative 'classes/mysql_database_provider.rb'
require_relative 'classes/mini_magick.rb'
require_relative 'classes/person.rb'

$database = MYSQLDatabaseProvider.new
$database.connect

def process_json_file
  file = File.read('data/data.json')
  arr = JSON.parse(file)

  arr.each do |data_set|
    if data_set
      elements_array = data_set['included']
      elements_array.each { |person| Person.process_json(person) }
    end
  end
end

#p Person.all
process_json_file()
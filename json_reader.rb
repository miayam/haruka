require 'json'

class JsonReader
  attr_reader :students

  def initialize
    @students = []
  end

  def read_json(file)
    json_file = File.read(file)
    @students = JSON.parse(json_file, symbolize_names: true) # the key must be :symbol not "string"
  end
end

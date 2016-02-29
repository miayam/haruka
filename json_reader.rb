require 'json'

class JsonReader
  def initialize
    @students = []
  end

  def read_json(file)
    json_file = File.read(file)
    @students = JSON.parse(json_file, symbolize_names: true)
  end

  def students
    @students
  end
end

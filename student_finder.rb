require_relative 'json_reader'
require_relative 'orthodromic'

class StudentFinder
  include Orthodromic # we want to know the distance on spherical surface
  attr_reader :invited_students

  def initialize(radius, coordinate)
    @invited_students = []
    super
  end

private
  def find
    search = JsonReader.new.read_json("students.json")
    @invited_students = search.students.select do |location|
      lat_radian = Orthodromic.radian(location[:latitude])
      long_radian = Orthodromic.radian(location[:longitude])
      Orthodromic.within_radius?(lat_radian, long_radian)
    end
  end
end

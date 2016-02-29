require_relative 'json_reader'
require_relative 'orthodromic'
require 'ap'

class StudentFinder
  include Orthodromic # we want to know the distance on spherical surface
  attr_reader :invited_students

  def initialize(radius, coordinate)
    @invited_students = []
    super
  end

  def find
    students = JsonReader.new.read_json("students.json")
    @invited_students = students.select do |location|
      Orthodromic.radian(20)
    end

    ap @invited_students
  end
end

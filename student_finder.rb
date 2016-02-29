require_relative 'json_reader'
require 'ap'

class StudentFinder
  attr_reader :invited_students
  attr_accessor :radius, :coordinate

  def initialize(radius, coordinate)
    @radius = radius
    @coordinate = {}
    @coordinate[:latitude] = coordinate[:latitude]
    @coordinate[:longitude] = coordinate[:longitude]
    @invited_students = []
  end

  def find
    students = JsonReader.new.read_json("students.json")
    @invited_students = students.select do |location|
      lat_radian = radian(location[:latitude])
      long_radian = radian(location[:longitude])
      within_radius? lat_radian, long_radian
    end
  end

private
  def radian(degree)
    degree * (Math::PI / 180)
  end

  def within_radius? lat_radian, long_radian
    distance(lat_radian, long_radian) <= @radius
  end
end

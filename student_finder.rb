require_relative 'json_reader'

class StudentFinder
  attr_reader :invited_students
  attr_accessor :radius, :coordinate # location from which the searching begin

  EARTH_RADIUS = 6371

  def initialize(radius, coordinate)
    @radius                 = radius
    @coordinate             = {}
    @coordinate[:latitude]  = coordinate[:latitude]
    @coordinate[:longitude] = coordinate[:longitude]
    @invited_students       = []
  end

  def found
    students = JsonReader.new.read_json("students.json")
    @invited_students = students.select do |location|
      within_radius?(radian(location[:latitude]),
                     radian(location[:longitude]))
    end
  end

private
  def radian(degree)
    degree * (Math::PI / 180)
  end

  def within_radius?(latitude2, longitude2)
    @radius >= distance(latitude2, longitude2)
  end

  def distance(latitude2, longitude2)
    EARTH_RADIUS * central_angle(latitude2, longitude2)
  end

  def central_angle(latitude2, longitude2)
    # https://en.wikipedia.org/wiki/Great-circle_distance
    # formula 1 doesn't work with small distance (14 km)
    # honestly I had no idea what's going on here :(

    latitude1  = radian(@coordinate[:latitude])
    longitude1 = radian(@coordinate[:longitude])
    dlat       = (latitude1 - latitude2).abs
    dlong      = (longitude1 - longitude2).abs
    delta      = Math.sin(dlat/2)**2 + Math.cos(latitude1) * Math.cos(latitude2) *
                 Math.sin(dlong/2)**2

    2 * Math.atan2(Math.sqrt(delta), Math.sqrt(1-delta))
  end
end

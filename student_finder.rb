require_relative 'json_reader'

EARTH_RADIUS = 6371

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

  def within_radius?(latitude_rad, longitude_rad)
    @radius >= distance(latitude_rad, longitude_rad)
  end

  def distance(latitude_rad, longitude_rad)
    EARTH_RADIUS * central_angle(latitude_rad, longitude_rad)
  end

  def central_angle(lat_2, long_2)
    # https://en.wikipedia.org/wiki/Great-circle_distance
    # formula 1 doesn't work with small distance (14 km)
    # honestly, I have no idea what's going on here :(

    lat_1 = radian(@coordinate[:latitude])
    long_1 = radian(@coordinate[:longitude])
    dlat = (lat_1 - lat_2)
    dlong = (long_1 - long_2)
    delta = Math.sin(dlat/2)**2 + Math.cos(lat_1) * Math.cos(lat_2) *
            Math.sin(dlong/2)**2

    2 * Math.atan2(Math.sqrt(delta), Math.sqrt(1 - delta))
  end
end

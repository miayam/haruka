module Orthodromic
  attr_accessor :radius, :coordinate

  def initialize(radius, coordinate)
    @radius = radius
    @coordinate = {}
    @coordinate[:latitude] = radian(coordinate[:latitude])
    @coordinate[:longitude] = radian(coordinate[:longitude])
  end

  def within_radius?(lat_radian, long_radian)
    distance(lat_radian, long_radian) <= @radius
  end

  def distance(lat_radian, long_radian)
    @radius * central_angle(lat_radian, long_radian)
  end

  def central_angle(lat_radian, long_radian)
    Math.acos(Math.sin(lat_radian) * Math.sin(@coordinate[:latitude]) +
              Math.cos(long_radian) * Math.cos(@coordinate[:longitude]) *
              Math.sin(long_diff(long_radian)))
  end

  def long_diff(long_radian)
    (@coordinate[:longitude] - long_radian).abs
  end

  def radian(degree)
    degree * (Math::PI / 180)
  end
end

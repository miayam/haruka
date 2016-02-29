require_relative "student_finder"

coordinate = {:latitude => 20, :longitude => 3}
radius = 14
test = StudentFinder.new(radius, coordinate)
ap test.find

require_relative 'student_finder'

gandaria_city = { latitude: -6.243376, longitude: 106.784425 }
radius = 14
students = StudentFinder.new(radius, gandaria_city)
invited_students = students.found

invited_students.each do |student|
  puts "#{student[:name]} - #{student[:id]}"
end

require_relative 'student_invitation'

gandaria_city = { latitude: -6.243376, longitude: 106.784425 }
radius = 14

students = StudentInvitation.new
students.within(radius, gandaria_city)
students.listing

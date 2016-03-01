require_relative 'student_finder'

class StudentInvitation
  def initialize
    @short_listed = []
  end

  def within(radius, coordinate)
    @short_listed = StudentFinder.new(radius, coordinate).found
  end

  def listing
    @short_listed.each do |student|
      puts "#{student[:name]}  -->  #{student[:id]}"
    end
  end
end

require_relative 'student_finder'

class StudentInvitation
  attr_reader :invited

  def initialize
    @invited = []
  end

  def within(radius, coordinate)
    @invited = StudentFinder.new(radius, coordinate).found
  end

  def listing
    @invited.each do |student|
      puts "#{student[:name]}  -->  #{student[:id]}"
    end
  end
end

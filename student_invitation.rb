require_relative 'student_finder'

class StudentInvitation
  attr_reader :invited

  def initialize
    @invited = []
  end

  def within(radius, coordinate)
    @invited = StudentFinder.new(radius, coordinate).found
    unless @invited
      puts "Sorry, no one there"
    end
  end

  def listing
    @invited.each do |student|
      puts "#{student[:name]}  -->  #{student[:id]}"
    end
  end
end

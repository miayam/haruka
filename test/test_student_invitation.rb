require 'minitest/spec'
require 'minitest/autorun'
require_relative '../student_invitation'

class TestStudentInvitation < Minitest::Test
  def setup
    @tester = StudentInvitation.new
  end

  def test_tester
    assert_instance_of StudentInvitation, @tester
  end

  # I am sorry I am running out of time, let's push
end

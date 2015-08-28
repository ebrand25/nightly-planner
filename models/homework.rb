class Homework
  attr_reader :assignment, :estimated_time, :priority
  def initialize(assignment, estimated_time, priority)
    @assignment = assignment
    @estimated_time = estimated_time
    @priority = priority
  end
end
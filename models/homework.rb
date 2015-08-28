class Homework
  attr_accessor :name, :estimated_time, :priority
  def initialize(name, estimated_time, priority)
    @name = name
    @estimated_time = estimated_time
    @priority = priority
  end
end
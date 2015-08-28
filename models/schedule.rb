require_relative 'activity.rb'
require_relative 'homework.rb'

class Schedule
  attr_accessor :start_hours, :start_minutes, :start_am_pm, :all_start_minutes, :homework_array, :activity_array, :final_schedule
  def initialize(start_hours, start_minutes, start_am_pm, homework_array, activity_array)
    all_start_minutes = (start_hours * 60) + start_minutes
    if start_am_pm == "PM"
      all_start_minutes = all_start_minutes.to_i + (12 * 60)
    else
    end
    @all_start_minutes = all_start_minutes
    @homework_array = homework_array
    @activity_array = activity_array
    @current_minutes = @all_start_minutes
    @current_activity = 0
    @final_schedule = []
    # Use a sort_by! method to deal with the priority_1-5 arrays
    @priority_5 = []
    @priority_4 = []
    @priority_3 = []
    @priority_2 = []
    @priority_1 = []
    @prioritized_homework = []
  end

#   def to_minutes(hours, minutes, am_pm)
#     all_minutes = (hours * 60) + minutes
#     if am_pm.upcase == "PM"
#       return all_minutes + (12 * 60)
#     else
#       return all_minutes
#     end
#   end

#   def to_time(all_minutes)
#     time_hours = all_minutes / 60
#     time_minutes = time_hours % 60
#     if hours > 12
#       hours = hours - 12
#       time_am_pm = "PM"
#     else
#       time_am_pm = "AM"
#     end
#     normal_time = "#{time_hours}:#{time_minutes} #{time_am_pm}"
  #   end

  def order_activity_array
    @activity_array.sort_by!{|activity| activity.all_start_minutes}
    return @activity_array
  end

  def prioritize_homework
    @homework_array.each do|homework|
      priority = homework.priority
      if priority == 5
        @priority_5.push(homework)
      elsif priority == 4
        @priority_4.push(homework)
      elsif priority == 3
        @priority_3.push(homework)
      elsif priority == 2
        @priority_2.push(homework)
      elsif priority == 1
        @priority_1.push(homework)
      else
        @priority_1.push(homework)
      end
    end
    # See line 11 of this document
    @prioritized_homework.push (@priority_5)
    @prioritized_homework.push (@priority_4)
    @prioritized_homework.push (@priority_3)
    @prioritized_homework.push (@priority_2)
    @prioritized_homework.push (@priority_1)
  return @prioritized_homework
  end

#   def make_final_schedule

#     @prioritized_homework.each do|homework_item|
#       if @current_minutes + homework_item.estimated_time <= activities_array[0].all_start_minutes
#         block_start_time_hours = (@current_minutes / 60).to_i
#         block_start_time_minutes = block_start_time_hours % 60
#         if block_start_time_hours > 12
#           block_start_time_hours = block_start_time_hours - 12
#           block_start_time_am_pm = "PM"
#         else
#           block_start_time_am_pm = "AM"
#         end
#           block_start_time = "#{block_start_time_hours}:#{block_start_time_minutes} #{block_start_time_am_pm}"

#         @current_minutes = @current_minutes + homework.estimated_time

#         block_end_time_hours = (@current_minutes / 60).to_i
#         block_end_time_minutes = block_end_time_hours % 60
#           if hours > 12
#             block_end_time_hours = block_end_time_hours - 12
#             block_end_time_am_pm = "PM"
#           else
#             block_end_time_am_pm = "AM"
#           end
#         block_end_time = "#{block_end_time_hours}:#{block_end_time_minutes} #{block_end_time_am_pm}"

#         time_block = {
#           :start_time => block_start_time,
#           :end_time => block_end_time,
#           :name => homework.assignment
#           }

#         @final_schedule.push time_block [0]



#       end
#       block_start_time_hours = (@current_minutes / 60).to_i
#       block_start_time_minutes = block_start_time_hours % 60
#         if block_start_time_hours > 12
#           block_start_time_hours = block_start_time_hours - 12
#           block_start_time_am_pm = "PM"
#         else
#           block_start_time_am_pm = "AM"
#         end
#           block_start_time = "#{block_start_time_hours}:#{block_start_time_minutes} #{block_start_time_am_pm}"

#         @current_minutes = @current_minutes + (activity_array[@current_activity].all_end_minutes - activity_array[@current_activity].all_start_minutes)

#         block_end_time_hours = (@current_minutes / 60).to_i
#         block_end_time_minutes = block_end_time_hours % 60
#         if block_end_time_hours > 12
#            block_end_time_hours = block_end_time_hours - 12
#            block_end_time_am_pm = "PM"
#         else
#            block_end_time_am_pm = "AM"
#         end
#         block_end_time = "#{block_end_time_hours}:#{block_end_time_minutes} #{block_end_time_am_pm}"

#         time_block = {
#           :start_time => block_start_time,
#           :end_time =>block_end_time,
#           :name => @activity_array[@current_activity]
#           }

#         @final_schedule.push time_block [0]
#         @current_activity = @current_activity + 1
#     end
#     return @final_schedule
#     puts @final_schedule
#   end
end
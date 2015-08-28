require_relative 'activity.rb'

activity1 = Activity.new("Dinner", 630, 730)
activity2 = Activity.new("Ice Cream", 830, 850)

array = [activity2, activity1]

array.sort_by!{|activity| activity.start_time}
puts array[0].name
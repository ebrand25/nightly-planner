require 'bundler'
Bundler.require

require_relative 'models/homework.rb'
require_relative 'models/activity.rb'
require_relative 'models/schedule.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post "/results" do
activity_array = []
homework_array = []
    puts "---------------"

    if params[:name_a1] != ""
    activity1 = Activity.new(params[:name_a1], params[:start_hours_a1], params[:start_minutes_a1], params[:start_am_pm_a1], params[:end_hours_a1], params[:end_minutes_a1], params[:end_am_pm_a1])
    puts "Name A1:"
    puts params[:name_a1]
    puts "Activity 1 name:"
    puts activity1.name
      activity_array.push(activity1)
    else
    end

    if params[:name_a2] != ""
    activity2 = Activity.new(params[:name_a2], params[:start_hours_a2], params[:start_minutes_a2], params[:start_am_pm_a2], params[:end_hours_a2], params[:end_minutes_a2], params[:end_am_pm_a2])
      activity_array.push(activity2)
    else
    end

    if params[:name_a3] != ""
    activity3 = Activity.new(params[:name_a3], params[:start_hours_a3], params[:start_minutes_a3], params[:start_am_pm_a3], params[:end_hours_a3], params[:end_minutes_a3], params[:end_am_pm_a3])
      activity_array.push(activity3)
    else
    end

    if params[:name_a4] != ""
    activity4 = Activity.new(params[:name_a4], params[:start_hours_a4], params[:start_minutes_a4], params[:start_am_pm_a4], params[:end_hours_a4], params[:end_minutes_a4], params[:end_am_pm_a4])
      activity_array.push(activity4)
    else
    end

    if params[:name_a5] != ""
    activity5 = Activity.new(params[:name_a5], params[:start_hours_a5], params[:start_minutes_a5], params[:start_am_pm_a5], params[:end_hours_a5], params[:end_minutes_a5], params[:end_am_pm_a5])
      activity_array.push(activity5)
    else
    end


    if params[:name_h1] != ""
      assignment1 = Homework.new(params[:name_h1], params[:estimated_time_h1], params[:priority_h1])
        puts "Assignment 1 name:"
        puts assignment1.name
      homework_array.push(assignment1)
    else
    end
    if params[:name_h2] != ""
      assignment2 = Homework.new(params[:name_h2], params[:estimated_time_h2], params[:priority_h2])
      homework_array.push(assignment2)
    else
    end
    if params[:name_h3] != ""
      assignment3 = Homework.new(params[:name_h3], params[:estimated_time_h3], params[:priority_h3])
      homework_array.push(assignment3)
    else
    end
    if params[:name_h4] != ""
      assignment4 = Homework.new(params[:name_h4], params[:estimated_time_h4], params[:priority_h4])
      homework_array.push(assignment4)
    else
    end
    if params[:name_h5] != ""
      assignment5 = Homework.new(params[:name_h5], params[:estimated_time_h5], params[:priority_h5])
      homework_array.push(assignment5)
    else
    end
    if params[:name_h6] != ""
      assignment6 = Homework.new(params[:name_h6], params[:estimated_time_h6], params[:priority_h6])
      homework_array.push(assignment6)
    else
    end
    if params[:name_h7] != ""
      assignment7 = Homework.new(params[:name_h7], params[:estimated_time_h7], params[:priority_h7])
      homework_array.push(assignment7)
    else
    end
    if params[:name_h8] != ""
      assignment8 = Homework.new(params[:name_h8], params[:estimated_time_h8], params[:priority_h8])
      homework_array.push(assignment8)
    else
    end

    @schedule = Schedule.new(params[:start_hours], params[:start_minutes], params[:start_am_pm], homework_array, activity_array)
#     @schedule.order_activity_array
#     @schedule.prioritize_homework
#     @schedule.make_final_schedule
#     @final_schedule = @schedule.final_schedule
    activity_array.each do|activity|
      puts "Activity array Each do:"
      puts activity.name
    end

    homework_array.each do|homework|
      puts "Homework array Each do:"
      puts homework.name
    end
#     @final_schedule.each do|time_block|
#       puts "Name:"
#       puts time_block.value
    end
    erb :results
  end

  get '/results' do
    @final_schedule
    erb :results
  end
end
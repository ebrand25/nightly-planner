class Activity
  attr_accessor :name, :start_hours, :start_minutes, :start_am_pm, :end_hours, :end_minutes, :end_am_pm, :all_start_minutes, :all_end_minutes
  def initialize(name, start_hours, start_minutes, start_am_pm, end_hours, end_minutes, end_am_pm)
    start_hours = start_hours.to_i
    start_minutes = start_minutes.to_i
    end_hours = end_hours.to_i
    end_minutes = end_minutes.to_i
    all_start_minutes = (start_hours * 60) + start_minutes
    if start_am_pm == "PM"
      all_start_miutes = all_start_minutes + (12 * 60)
    else
    end

    all_end_minutes = (end_hours * 60) + end_minutes
    if end_am_pm == "PM"
      all_end_minutes = all_end_minutes + (12 * 60)
    else
    end

    @name = name
    @all_start_minutes = all_start_minutes
    @all_end_minutes = all_end_minutes
  end
end

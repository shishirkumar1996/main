module ApplicationHelper

  def date_time_helper(date_time)
    current_time = Time.zone.now
    days = (current_time - date_time).to_i / 1.day
    if(days > 31)
      "on #{date_time.strftime("%b %d, %Y")}"
    else
      "#{distance_of_time_in_words(date_time, current_time)} ago"
    end
  end
  
end

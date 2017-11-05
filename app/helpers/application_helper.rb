module ApplicationHelper

  def date_time_helper(date_time)
    current_time = Time.zone.now
    days = (current_time - date_time).to_i / 1.day
    if(days > 31)
      "#{date_time.strftime("%b %d, %Y")}"
    else
      "#{distance_of_time_in_words(date_time, current_time)} ago".capitalize
    end
  end

  def img_helper(obj, size)
    img = obj.image
    if img.file
      img = case size
      when 'mini' then img.mini
      when 'large' then img.big
      when 'small' then img.thumb
      when 'medium' then img.profile
      end
      img_url = img.url
    else
      img_url = 'dummies/'
      img_url << size << '.png'
    end
    link_to image_tag(img_url), obj, class: 'profile_pic'
  end

end

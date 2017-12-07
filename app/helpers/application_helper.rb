module ApplicationHelper

  def display_date_time(date_time)
    current_time = Time.zone.now
    days = (current_time - date_time).to_i / 1.day
    if(days > 31)
      "#{date_time.strftime("%b %d, %Y")}"
    else
      "#{distance_of_time_in_words(date_time, current_time)} ago".capitalize
    end
  end

  def display_img(obj, size)
    img = obj.image
    img_url = img.file ? img.public_send(size).url : "dummies/#{size}.png"
    link_to image_tag(img_url), obj, class: 'profile_pic'
  end

end

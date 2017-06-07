json.array! @notifications.each do |notification|
	json.user notification.user
	json.message notification.message
	json.link notification.link
end

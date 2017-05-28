json.array! @notifications do |notification|
	json.user notification.user
	json.message @notification.message
end

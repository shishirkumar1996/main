module Replyable
  extend ActiveSupport::Concern
  def replies_all_levels
		all_replies = []
		stack = []
		replies.each do |top_reply|
			top_reply.level = 0
			stack << top_reply
		end
		until stack.empty?
			current_reply = stack.pop
			all_replies << current_reply
			current_reply.replies.each do |reply|
				reply.level = current_reply.level + 1
				stack << reply
			end
		end
		all_replies
	end
end

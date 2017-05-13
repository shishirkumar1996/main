class Group < ApplicationRecord

	mount_uploader :image, GroupimageUploader
	has_and_belongs_to_many :users
	has_many :group_articles,dependent: :destroy
	has_many  :group_questions,dependent: :destroy
	
	attr_reader :user_tokens
	
	def user_tokens=(tokens)
		self.user_ids = User.ids_from_tokens(tokens)
	end
	
	
	
	
end

class Group < ApplicationRecord

	mount_uploader :image, GroupimageUploader
	has_many :group_articles, dependent: :destroy
	has_many  :group_questions,dependent: :destroy
	has_many :groups_users, foreign_key: :group_id, dependent: :destroy
	has_many :members, through: :groups_users, source: :user

	attr_reader :user_tokens

	def user_tokens=(tokens)
		self.user_ids = User.ids_from_tokens(tokens)
	end

end

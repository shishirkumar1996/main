class Group < ApplicationRecord

	before_validation { name.strip! }
	validates :name, presence: true, length: { maximum: 50 }
	attr_reader :user_tokens
	mount_uploader :image, GroupimageUploader
	has_many :group_articles, dependent: :destroy
	has_many  :group_questions,dependent: :destroy
	has_many :groups_users, foreign_key: :group_id, dependent: :destroy
	has_many :members, through: :groups_users, source: :user

	def user_tokens=(tokens)
		self.user_ids = User.ids_from_tokens(tokens)
	end

end

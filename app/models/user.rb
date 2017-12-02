class User < ApplicationRecord

	searchkick word_start: [:name]

	has_secure_password

	mount_uploader :image,ImageUploader

	attr_accessor :remember_token

	validates :name,presence: true,length: {maximum: 50}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },uniqueness: {case_sensitive: false}
  before_save :downcase_email

	validates :password,presence: true, length: { minimum: 6 },allow_nil: true

	has_many :created_notifications,class_name: "Notification"

	has_many :answer_bookmarks, class_name: 'Answers::Bookmark'
	has_many :bookmarked_answers, through: :answer_bookmarks,
	source: :answer

	has_many :question_bookmarks, class_name: 'Questions::Bookmark'
	has_many :bookmarked_questions, through: :question_bookmarks,
	source: :question

	has_many :article_bookmarks, class_name: 'Articles::Bookmark'
	has_many :bookmarked_articles, through: :article_bookmarks,
	source: :article

	has_many :articlerelations,foreign_key: :user_id,dependent: :destroy
	has_many :likedarticles,through: :articlerelations,source: :article

	has_many :badarticlerelations,foreign_key: :user_id,
	dependent: :destroy
	has_many :dislikedarticles,through: :badarticlerelations,
	source: :article

	has_many :grouparticlerelations, foreign_key: :user_id,dependent: :destroy
	has_many :likedgrouparticles, through: :grouparticlerelations,source: :group_article

	has_many :badgrouparticlerelations,foreign_key: :user_id,
	dependent: :destroy
	has_many :dislikedgrouparticles,through: :badgrouparticlerelations,
	source: :group_article

	has_many :answerrelations,foreign_key: :user_id,dependent: :destroy
	has_many :likedanswers,through: :answerrelations,source: :answer

	has_many :badanswerrelations,foreign_key: :user_id,dependent: :destroy
	has_many :dislikedanswers,through: :badanswerrelations,
	source: :answer

	has_many :groupanswerrelations, foreign_key: :user_id,dependent: :destroy
	has_many :likedgroupanswers,through: :groupanswerrelations,
	source: :groupanswer

	has_many :badgroupanswerrelations,foreign_key: :user_id,
	dependent: :destroy
	has_many :dislikedgroupanswers,through: :badgroupanswerrelations,
	source: :groupanswer

  has_many :notifications, dependent: :destroy

	has_many :articles,dependent: :destroy

	has_many :questions, dependent: :destroy

	has_many :answers, dependent: :destroy

	has_many :answer_replies ,dependent: :destroy

	has_many :article_replies, dependent: :destroy

	has_many :interests, foreign_key: :person_id,dependent: :destroy

	has_many :relations, through: :interests,source: :domain

	has_many :academics, foreign_key: "student_id", dependent: :destroy

	has_many :institutes, through: :academics, source: :institute

	has_many :groups_users, foreign_key: :user_id, dependent: :destroy

	has_many :groups, through: :groups_users, source: :group

	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :following ,through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def authenticated?(attribute,token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	def self.ids_from_tokens(tokens)
		tokens.gsub!(/<<<(.+?)>>>/) {create!(name: $1.capitalize).id}
		tokens.split(',')
	end

	def self.from_google_omniauth(auth)
		if User.exists?(:email=>auth.info.email)
			return User.find_by(email: auth.info.email)
		end
		where(provider: auth.provider,uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.password = user.password_confirmation = SecureRandom.urlsafe_base64(n=8)
			user.email = auth.info.email
			user.save!
		end
	end

	def self.from_omniauth(auth)
		if User.exists?(:email=> auth.info.email)
			return User.find_by(email: auth.info.email)
		end
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.remote_image_url = auth.info.image.gsub('http://','https://')
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.password = user.password_confirmation = SecureRandom.urlsafe_base64(n=8)
			user.email = auth.info.email
			user.save!
		end
	end

	def has_relations(domain)
		relations.include?(domain)
	end

	def follow(other_user)
		following<< other_user
		@notification = Notification.new
	end

	def unfollow(other_user)
		following.delete(other_user)
	end

	def following?(other_user)
		following.include?(other_user)
	end

	def bookmark_question?(question)
		bookmarked_questions.include?(question)
	end

	def bookmark_article?(article)
		bookmarked_articles.include?(article)
	end

	def bookmark_answer?(answer)
		bookmarked_answers.include?(answer)
	end

	def like_answer?(answer)
		likedanswers.include?(answer)
	end

	def dislike_answer?(answer)
		dislikedanswers.include?(answer)
	end

	def like_groupanswer?(answer)
		likedgroupanswers.include?(answer)
	end

	def dislike_groupanswer?(answer)
		dislikedgroupanswers.include?(answer)
	end

	def like_article?(article)
		likedarticles.include?(article)
	end

	def dislike_article?(article)
		dislikedarticles.include?(article)
	end

	def like_grouparticle?(article)
		likedgrouparticles.include?(article)
	end

	def dislike_grouparticle?(article)
		dislikedgrouparticles.include?(article)
	end

	def answered?(question)
		question.answers.each do |answer|
			return true if answers.include? answer
		end
		return false
	end

	def group_answered?(question)
		question.groupanswers.each do |answer|
			return true if groupanswers.include? answer
		end
		return false
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	private

		def downcase_email
			self.email = email.downcase
		end

end

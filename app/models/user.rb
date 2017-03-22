class User < ApplicationRecord

	has_secure_password
	validates :name,presence: true,length: {maximum: 50}
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },uniqueness: {case_sensitive: false}
  before_save :downcase_email   
 validates :password,presence: true, length: { minimum: 6 },allow_nil: true
  
  attr_accessor :remember_token
  before_save :downcase_email
	has_many :articles,dependent: :destroy
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :replies ,dependent: :destroy
	has_and_belongs_to_many :groups   , dependent: :nullify
	has_many :interests, foreign_key: :person_id,dependent: :destroy
											 
	has_many :relations, through: :interests,source: :domain
	has_many :academics, foreign_key: "student_id", dependent: :destroy
	has_many :universities, through: :academics, source: :domain
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
			
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
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
	
	def follow(other_user)
		following<< other_user
	end
	
	def unfollow(other_user)
		following.delete(other_user)
	end
	
	def following?(other_user)
		following.include?(other_user)
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

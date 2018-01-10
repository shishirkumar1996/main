class Reply < ApplicationRecord
  self.abstract_class = true
  VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/
  attr_accessor :level
  belongs_to :user, class_name: '::User'
  validates :body, presence: true, format: { with: VALID_BODY_REGEX }
  default_scope -> { order(created_at: :desc) }
  def self.inherited(klass)
    super
    klass.class_eval do
      has_many :replies, class_name: "::#{self.name}", foreign_key: 'parent_reply_id'
      belongs_to :parent_reply, class_name: "::#{self.name}"
    end
  end
end

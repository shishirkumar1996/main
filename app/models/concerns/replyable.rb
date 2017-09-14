module Replyable
  extend ActiveSupport::Concern

  VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

  included do
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :body, presence: true, format: {with: VALID_BODY_REGEX}
  end

end

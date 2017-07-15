class ArticleReply < ApplicationRecord

  belongs_to :article, counter_cache: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

  validates :body,presence: true,format: {with: VALID_BODY_REGEX}

end

class ArticleReply < ApplicationRecord

  belongs_to :article, counter_cache: true
  belongs_to :user

  VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

  validates :body,presence: true,format: {with: VALID_BODY_REGEX}

end

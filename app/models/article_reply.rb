class ArticleReply < ApplicationRecord
  include Replyable
  belongs_to :article, counter_cache: true
end

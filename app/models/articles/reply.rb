module Articles
  class Reply < ApplicationRecord
    attr_accessor :level
    self.table_name = 'article_replies'
    belongs_to :user, class_name: '::User'
    belongs_to :article, class_name: '::Article'
    has_many :replies, class_name: "#{self.name}", foreign_key: 'parent_reply_id'
    belongs_to :parent_reply, class_name: "#{self.name}"
  end
end

module Articles
  class Reply < ::Reply
    self.table_name = underscored_name.pluralize
    belongs_to :article, class_name: '::Article'
  end
end

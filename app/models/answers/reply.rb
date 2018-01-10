module Answers
  class Reply < ::Reply
    self.table_name = underscored_name.pluralize
    belongs_to :answer, class_name: '::Answer'
  end
end

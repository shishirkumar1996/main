module Finder
  extend ActiveSupport::Concern
  private
    def find_by_type(id, type)
      case type
      when 'article'
        Article.find(id)
      when 'answer'
        Answer.find(id)
      when 'question'
        Question.find(id)
      end
    end
end

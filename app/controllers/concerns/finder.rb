module Finder
  extend ActiveSupport::Concern
  private
    def find_by_type(id, type)
      case type
      when 'question'
        Question.select(:id).find(id)
      when 'article'
        Article.select(:id).find(id)
      when 'answer'
        Answer.select(:id).find(id)
      end
    end
end
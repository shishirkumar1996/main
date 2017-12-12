module Finder
  extend ActiveSupport::Concern
  TYPE_TO_MODEL = {'question' => Question, 'answer' => Answer, 'article' => Article,
                  'article_reply' => Articles::Reply}
  private_constant :TYPE_TO_MODEL
  private
    def find_by_type(id, type)
      TYPE_TO_MODEL[type].find id
    end
end

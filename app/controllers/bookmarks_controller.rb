class BookmarksController < ApplicationController
  before_action :logged_in_user

  def create
    bookmark = bookmark_factory params[:type], params[:type_id]
    bookmark.user_id = current_user.id
    bookmark.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    bookmark_find(params[:type], params[:type_id]).destroy
    respond_to do |format|
      format.js
    end
  end

  private

    def bookmark_factory(type, id)
      case type
      when 'question'
        QuestionBookmarkRelation.new(question_id: id)
      when 'answer'
        AnswerBookmarkRelation.new(answer_id: id)
      when 'article'
        ArticleBookmarkRelation.new(article_id: id)
      end
    end

    def bookmark_find(type, id)
      user = current_user.id
      case type
      when 'question'
        QuestionBookmarkRelation.find_by user_id: user, question_id: id
      when 'answer'
        AnswerBookmarkRelation.find_by user_id: user, answer_id: id
      when 'article'
        ArticleBookmarkRelation.find_by user_id: user, article_id: id
      end
    end

end

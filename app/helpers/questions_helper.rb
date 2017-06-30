module QuestionsHelper

  def question_bookmark_helper(question)
    if current_user.bookmark_question?(question)
      render partial: 'questions/unbookmark', locals: { question: question }
    else
      render partial: 'questions/bookmark', locals: { question: question }
    end
  end

end

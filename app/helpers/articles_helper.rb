module ArticlesHelper

  def article_bookmark_helper(article)
    if current_user.bookmark_article?(article)
      render partial: 'articles/unbookmark', locals: { article: article }
    else
      render partial: 'articles/bookmark', locals: { article: article }
    end
  end

  def display_article_replies(article)
    article.article_replies.each do |article_reply|
      render article_reply
    end
  end

end

module ArticlesHelper

  def article_bookmark_helper(article)
    if current_user.bookmark_article?(article)
      render partial: 'articles/unbookmark', locals: { article: article }
    else
      render partial: 'articles/bookmark', locals: { article: article }
    end
  end

end

class ArticleRepliesController < ApplicationController
  before_action :set_article_reply, only: [:edit, :update, :destroy]

  before_action :logged_in_user

  def edit
  end

  def create
		article = Article.find(params[:article_id])
		@article_reply = article.article_replies.build(article_reply_params)
		@article_reply.user = current_user
  	#@id = "articlereplies_#{params[:article_id]}"
  	#@field =  "articlefield_#{params[:article_id]}"

  	respond_to do |format|

  	   if @article_reply.save
  			format.js {render :layout=>false, content_type: 'text/javascript' }
  	   else
  			format.json {render :json=> @article_reply.errors,:status=> :unprocessable_entity}
  	   end

     end
	end

  def update
    respond_to do |format|
      if @article_reply.update(article_reply_params)
        format.html { redirect_to @article_reply, notice: 'Articlereply was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_reply }
      else
        format.html { render :edit }
        format.json { render json: @article_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article_reply.destroy
    respond_to do |format|
      format.html { redirect_to article_replies_url, notice: 'Articlereply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_article_reply
      @article_reply = ArticleReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_reply_params
      params.require(:article_reply).permit(:body)
    end
end

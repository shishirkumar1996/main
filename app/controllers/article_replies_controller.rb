class ArticleRepliesController < ApplicationController
  before_action :set_article_reply, only: [:show, :edit, :update, :destroy]

  before_action :logged_in_user

  def index
    @articlereplies = ArticleReply.all
  end

  def show
  end

  def new
    @articlereply = ArticleReply.new
  end

  def edit
  end

  def create
		@article = Article.find(params[:article_id])
		@articlereply = @article.article_replies.build(article_reply_params)
		@articlereply.user = current_user
  	@id = "articlereplies_#{params[:article_id]}"
  	@field =  "articlefield_#{params[:article_id]}"

  	respond_to do |format|
  	if @articlereply.save

  			format.html
  			format.js {render :layout=>false, content_type: 'text/javascript' }

  	else
  			format.json {render :json=> @articlereply.errors,:status=> :unprocessable_entity}
  	end
  end
	end
  def update
    respond_to do |format|
      if @articlereply.update(article_reply_params)
        format.html { redirect_to @articlereply, notice: 'Articlereply was successfully updated.' }
        format.json { render :show, status: :ok, location: @articlereply }
      else
        format.html { render :edit }
        format.json { render json: @articlereply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @articlereply.destroy
    respond_to do |format|
      format.html { redirect_to article_replies_url, notice: 'Articlereply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article_reply
      @articlereply = ArticleReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_reply_params
      params.require(:article_reply).permit(:body)
    end
end

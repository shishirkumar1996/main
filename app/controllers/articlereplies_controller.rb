class ArticlerepliesController < ApplicationController
  before_action :set_articlereply, only: [:show, :edit, :update, :destroy]
  
  before_action :logged_in_user

  def index
    @articlereplies = Articlereply.all
  end

  def show
  end

  def new
    @articlereply = Articlereply.new
  end

  def edit
  end

  def create
		@article = Article.find(params[:article_id])
		@articlereply = @article.articlereplies.build(articlereply_params)
		@articlereply.user = current_user
  	@id = "articlereplies_#{params[:article_id]}"
  	@field =  "articlefield_#{params[:article_id]}"
  	@articlereply.save!
  		respond_to do |format|
  			format.html
  			format.js
  		end
  end

  def update
    respond_to do |format|
      if @articlereply.update(articlereply_params)
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
      format.html { redirect_to articlereplies_url, notice: 'Articlereply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_articlereply
      @articlereply = Articlereply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articlereply_params
      params.require(:articlereply).permit(:body)
    end
end

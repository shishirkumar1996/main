class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create,:new]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @domains = Domain.all
    
    
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
  	
    @article = current_user.articles.build(article_params)
    @article.domain = Domain.find_by(name: params[:domain])	
    if @article.save
		flash[:success] = "article created!"
		redirect_to root_url
		else
			flash[:danger] = "some error occured!"
			render 'new'
		end
		
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title,:body)
    end
end

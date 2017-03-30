class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create,:new]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
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
    @tokens = params[:domain_tokens]
    @tokens = @tokens.split(',')
    @tokens.each do |token|
    	if(@id[0..2]=="<<<")
    		@domain = Domain.new
    		@domain.name = token[3..-4]
    		@domain.save!
    		token = @domain.id
    	end
    	d = Domain.find(token);
    	d.articles << @article
    	end
    	
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
      params.require(:article).permit(:title,:body,:domain_tokens)
    end
end

class ArticlesController < ApplicationController
  before_action :set_article, except: [:new, :index, :create]
  before_action :logged_in_user, except: [:show,:collection]
	before_action :admin_user, only: [:index]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
    @domains = Domain.all
  end

  # GET /articles/1/edit
  def edit
  end

  def create

    @article = current_user.articles.build(article_params)
    if @article.save
    @tokens = params[:domain_tokens]
    @tokens = @tokens.split(',')
    @tokens.each do |token|
    	if(token[0..2]=="<<<")
    		@domain = Domain.new
    		@domain.name = token[3..-4]
    		@domain.save!
    		token = @domain.id
    	end
    	d = Domain.find(token);
    	d.articles << @article
    	end

		flash[:success] = "article created!"
		redirect_to root_url
		else
			flash[:danger] = "some error occured!"
			render 'new'
		end

  end

  def update
  	if @article.update_attributes(article_params)
  	flash[:success] = "article updated"
  		redirect_to root_url
  	else
  		flash[:danger] = "some error occured"
  		render action: 'edit'
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

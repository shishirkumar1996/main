class ArticlesController < ApplicationController
  before_action :logged_in_user, except: [:show,:collection]
	before_action :admin_user,only: [:index]
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
		@article = Article.find(params[:id])
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
  	@article = Article.find(params[:id])
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
  
  def collection
  	@article = Article.find(params[:id])
  	@replies_id = params[:replies_id]
  	@replies
  		if(params[:last])
  			@lastreply = Articlereply.find(params[:last])
  			@replies = @article.articlereplies.order(created_at: :desc).where('created_at < ?',@lastreply.created_at).limit(5)
  		else
  			@replies = @article.articlereplies.order(created_at: :desc).limit(5)
  		end
  	#.map{|reply| {:id => reply.id,
  #	:body=>reply.body,:created_at=>reply.created_at.strftime("%d %b,%Y"),:image_address => reply.user.image? ? reply.user.image.mini.url : '/assets/dummies/mini.png',:username => reply.user.name,:redirect_address => user_path(reply.user)}}
  		respond_to do |format|
 				format.html
  			format.js {render :layout=>false,content_type: 'text/javascript'}
  			
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

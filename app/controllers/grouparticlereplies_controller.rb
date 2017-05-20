class GrouparticlerepliesController < ApplicationController
  before_action :set_grouparticlereply, only: [:show, :edit, :update, :destroy]
	
	before_action :logged_in_user
	before_action :same_group_user
	
  def index
    @grouparticlereplies = Grouparticlereply.all
  end

  def show
  end

  def new
    @grouparticlereply = Grouparticlereply.new
  end

  def edit
  end

  def create
  	@grouparticle = GroupArticle.find(params[:group_article_id])
  	@grouparticlereply = @grouparticle.grouparticlereplies.build(grouparticlereply_params)
  	@grouparticlereply.user = current_user
  	@id = "grouparticlereplies_#{params[:group_article_id]}"
  	@field = "grouparticlefield_#{params[:group_article_id]}"
  	@grouparticlereply.save!
  		respond_to do |format|
  			format.html
  			format.js
  		end
  end

  def update
    respond_to do |format|
      if @grouparticlereply.update(grouparticlereply_params)
        format.html { redirect_to @grouparticlereply, notice: 'Grouparticlereply was successfully updated.' }
        format.json { render :show, status: :ok, location: @grouparticlereply }
      else
        format.html { render :edit }
        format.json { render json: @grouparticlereply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @grouparticlereply.destroy
    respond_to do |format|
      format.html { redirect_to grouparticlereplies_url, notice: 'Grouparticlereply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grouparticlereply
      @grouparticlereply = Grouparticlereply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grouparticlereply_params
     params.require(:grouparticlereply).permit(:body)
    end

		def same_group_user
    	if logged_in?
				unless Group.find(params[:group_id]).members.exists?(current_user)
			redirect_to root_url
				end
			end
		end


end

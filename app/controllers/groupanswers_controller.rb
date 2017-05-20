class GroupanswersController < ApplicationController
  before_action :set_groupanswer, only: [:show, :edit, :update, :destroy]
	before_action :logged_in_user
	before_action :same_group_user

  # GET /groupanswers
  # GET /groupanswers.json
  def index
    @groupanswers = Groupanswer.all
  end

  # GET /groupanswers/1
  # GET /groupanswers/1.json
  def show
  end

  # GET /groupanswers/new
  def new
  	@group = Group.find(params[:group_id])
    @groupanswer = Groupanswer.new
		@groupquestion = GroupQuestion.find(params[:group_question_id])
  end

  # GET /groupanswers/1/edit
  def edit
  	@groupanswer = Groupanswer.find(params[:id])
  	@groupquestion = @groupanswer.question
  	@group = @groupquestion.group
  end

  # POST /groupanswers
  # POST /groupanswers.json
  def create
	@groupquestion = GroupQuestion.find(params[:group_question_id])
	@groupanswer = @groupquestion.groupanswers.build(groupanswer_params)
	@groupanswer.user = current_user
		if @groupanswer.save
			flash[:success] = "answer submitted"
				redirect_to @groupquestion.group
			else
				flash[:danger] = "some error occured"
				render 'new'
			end

  end

  # PATCH/PUT /groupanswers/1
  # PATCH/PUT /groupanswers/1.json
  def update
	@groupanswer = Groupanswer.find(params[:id])
	if @groupanswer.update_attributes(groupanswer_params)
		flash[:success] = "answer updated"
		redirect_to @groupanswer.group_question.group
	else
		flash[:danger] = "some error occured"
		render action: "edit"
	end

  end

  # DELETE /groupanswers/1
  # DELETE /groupanswers/1.json
  def destroy
    @groupanswer.destroy
    respond_to do |format|
      format.html { redirect_to groupanswers_url, notice: 'Groupanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def collection

  	@groupanswer = Groupanswer.find(params[:id])
  	@groupreplies = @groupanswer.groupquestionreplies.map{|reply| {:id => reply.id,
  	:body=>reply.body,:created_at=>reply.created_at.strftime("%d %b,%Y"),:image_address => reply.user.image? ? reply.user.image.mini.url : '/assets/dummies/mini.png',:username => reply.user.name,:redirect_address => user_path(reply.user)}}
  		respond_to do |format|
  			format.json {
  				render :json => @groupreplies }
  				format.html
  		end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupanswer
      @groupanswer = Groupanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupanswer_params
      params.require(:groupanswer).permit(:body)
    end
    
    def same_group_user
    	if logged_in?
				unless Group.find(params[:group_id]).members.exists?(current_user)
			redirect_to root_url
				end
			end
		end
    
    
end

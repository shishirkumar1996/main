class GroupQuestionsController < ApplicationController
 before_action :logged_in_user
 before_action  :same_group_user

  def index
  end

  def show
  end

  def new
  	@group = Group.find(params[:group_id])
    @groupquestion = GroupQuestion.new
    
  end

  def edit
  end

  def create
  	@group  = Group.find(params[:group_id])
		@question = @group.group_questions.build(group_question_params)
		@question.user=  current_user
		if @question.save
			flash[:success] = "question submitted"
			redirect_to @group
		else
			flash[:danger] = "some error occured"
			render 'new'
		end
   
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = GroupQuestion.find(params[:id])
    end

    def group_question_params
      params.require(:group_question).permit(:title,:description)
    end

		def same_group_user
    	if logged_in?
				unless Group.find(params[:group_id]).members.exists?(current_user)
			redirect_to root_url
				end
			end
		end
		
end

class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
	before_action :logged_in_user,except: [:show,:collection]
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @question  = Question.find(params[:question_id])
  end

  # GET /answers/1/edit
  def edit
		@answer = Answer.find(params[:id])
  	@question = @answer.question
  end

	def collection
		@answer = Answer.find(params[:id])
		@replies = @answer.replies
		@replies_id = params[:replies_id]
		respond_to do |format|
			format.js {render :layout=>false, content_type:  'text/javascript'}
			format.json {
			render :json => @replies }
			format.html
		end
	end		
	
	
  # POST /answers
  # POST /answers.json
  def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build(answer_params)
		@answer.user = current_user
		if @answer.save
			flash[:success] = "answer submitted"
			redirect_to root_url
		else
			flash[:danger] = "some error occured"
			render 'new'
		end
    
  end

  def update
		@answer = Answer.find(params[:id])
		if @answer.update_attributes(answer_params)
			flash[:success] = "answer updated"
			redirect_to root_url
		else
			flash[:danger] = "some error occured"
			render action: "edit"
		end

  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body,:anonymous)
    end
end

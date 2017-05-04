class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create,:new]

  def index
    @questions = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @domains = Domain.all
  end

  def edit
  end

  def create
		@question = current_user.questions.build(question_params)
		@tokens = params[:domain_tokens]
		@tokens = @tokens.split(',')
		@tokens.each do |token|
			if(!Domain.order(:id).map{|domain| "#{domain.id}"}.include?(token))
				@domain = Domain.new
		#		token = token[0..-4]
				@domain.name = token[3..-4]
				@domain.save!
				token = @domain.id
			end
			d = Domain.find(token);
			d.questions << @question
		end
			
		
		if @question.save
			flash[:success] = "question submitted"
			redirect_to root_url
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
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title,:description,:anonymous,:domain_tokens)
    end
end

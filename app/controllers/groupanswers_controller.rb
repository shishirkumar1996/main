class GroupanswersController < ApplicationController
  before_action :set_groupanswer, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @groupanswer.update(groupanswer_params)
        format.html { redirect_to @groupanswer, notice: 'Groupanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupanswer }
      else
        format.html { render :edit }
        format.json { render json: @groupanswer.errors, status: :unprocessable_entity }
      end
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
  	@groupreplies = @groupanswer.groupquestionreplies.map{|reply|
  	{:id=> reply.id,:body=>reply.body,:created_at=>reply.created_at }}
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
end

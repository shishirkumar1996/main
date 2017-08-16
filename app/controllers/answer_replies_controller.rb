class AnswerRepliesController < ApplicationController

	before_action :logged_in_user
	before_action :set_reply, only: [:update, :destroy]

  def index
    @answer_replies = AnswerReply.all
  end

  def show
  end

  def new
    @answer_reply = AnswerReply.new
    respond_to do |format|
    	format.html
    	format.js
    end
  end

  def edit
  end

  def create
		@answer = Answer.find(params[:answer_id])
		@reply = @answer.answer_replies.build(reply_params)
		@reply.user = current_user
		@id = "replies_#{params[:answer_id]}"
		@field = "field_#{params[:answer_id]}"

		respond_to do |format|
			if @reply.save!

				format.html
				format.js { render :layout=>false,content_type: 'text/javascript'}
			else
				format.json {render :json=> @reply.errors,:status=> :unprocessable_entity}
			end
		end

  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = AnswerReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:body)
    end
end

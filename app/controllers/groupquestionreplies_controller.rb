class GroupquestionrepliesController < ApplicationController
  before_action :set_groupquestionreply, only: [:show, :edit, :update, :destroy]
	
	before_action :logged_in_user
	before_action :same_group_user
 
  def index
    @groupquestionreplies = Groupquestionreply.all
  end

  def show
  end

  def new
    @groupquestionreply = Groupquestionreply.new
  end

  # GET /groupquestionreplies/1/edit
  def edit
  end

  def create
		@groupanswer = Groupanswer.find(params[:groupanswer_id])
		@groupanswerreply = @groupanswer.groupquestionreplies.build(groupquestionreply_params)
		@groupanswerreply.user = current_user
		@id = "groupanswerreplies_#{params[:groupanswer_id]}"
		@field = "groupanswerfield_#{params[:groupanswer_id]}"
		@groupanswerreply.save!
		@value = "<li>"+ @groupanswerreply.body+"<br>"+@groupanswerreply.created_at.strftime("%d %b,%Y")+"</li>"+"<br>"
		respond_to do |format|
			format.html
			format.js
		end
		
  end

  # PATCH/PUT /groupquestionreplies/1
  # PATCH/PUT /groupquestionreplies/1.json
  def update
    respond_to do |format|
      if @groupquestionreply.update(groupquestionreply_params)
        format.html { redirect_to @groupquestionreply, notice: 'Groupquestionreply was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupquestionreply }
      else
        format.html { render :edit }
        format.json { render json: @groupquestionreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupquestionreplies/1
  # DELETE /groupquestionreplies/1.json
  def destroy
    @groupquestionreply.destroy
    respond_to do |format|
      format.html { redirect_to groupquestionreplies_url, notice: 'Groupquestionreply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupquestionreply
      @groupquestionreply = Groupquestionreply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupquestionreply_params
			params.require(:groupquestionreply).permit(:body)
    end
    
    def same_group_user
    	if logged_in?
				unless Group.find(params[:group_id]).members.exists?(current_user)
			redirect_to root_url
				end
			end
		end
    
end

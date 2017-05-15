class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
	before_action :logged_in_user
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  	@group = Group.find(params[:id])
  	@groupfeed = (@group.group_questions+@group.group_articles).sort_by(&:created_at).reverse
  end

	def prepopulate
		@group = Group.find(params[:id])
		@users = @group.users.map{|user| {:id=>user.id,:text =>user.name}}
		
		respond_to do |format|
			format.json{
			render :json => @users
			}
			end
	end
  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @user  = current_user
    @user.groups << @group
    @group.save!
   	redirect_to @group 
  end

	def invite
		@group = Group.find(params[:id])
	end

	def member	
		@group = Group.find(params[:id])
	end
		
	def add
	@tokens = params[:user_tokens]
	@tokens = @tokens.split(',')
	@group = Group.find(params[:group])
	@tokens.each do |token|
		@user = User.find(token)
		if(!@user.groups.include?(@group))
		@user.groups << @group
		@notification = Notification.new
		@notification.message = "#{current_user.name} added you to  group #{@group.name}"
		@notification.link = "#{group_path(@group)}"
		@user.notifications<< @notification
		@notification.save!	
		end
	end
	redirect_to @group
	end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
  end

	def edit_image
		@group = Group.find(params[:id])
	end
	
	
	def image
		@group = Group.find(params[:id])
		@group.image = params[:image]
		@group.save!
		redirect_to edit_image_group_path(@group)
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name,:user_tokens)
    end
end

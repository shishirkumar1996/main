class InstitutesController < ApplicationController
	before_action :logged_in_user,only:[:create,:new]
	
	
	def index
		@institutes = Institute.where("name ILIKE ?","%#{params[:term]}%").map{|institute| { :id => institute.id, :text => institute.name }}
		
		respond_to do |format|
			format.json{
				render :json => @institutes
			}
		end
	end
	
	def show
		@institute = Institute.find(params[:id])
	end
	
	def new
		@institute = Institute.new
	end
	
	
	private
	
	def institute_params
		params.require(:institute).permit(:name)
	end
	


end

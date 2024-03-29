class DomainsController < ApplicationController
 before_action :logged_in_user,except: [:show]

  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.where("name ILIKE ?", "%#{params[:term]}%").map{|domain| {:id =>domain.id, :text =>domain.name }}
    
    respond_to do |format|
    	format.json {
    	render :json => @domains
    }
   	end
  end

  def show
  	require 'will_paginate/array'
   @domain = Domain.find(params[:id])
   @feed = (@domain.articles+@domain.questions).sort_by(&:created_at).reverse.paginate(page: params[:page],per_page: 2)
  	@related_domain = (@domain.supersets+@domain.subsets)
  end

  # GET /domains/new
  def new
    @domain = Domain.new
  end

  # GET /domains/1/edit
  def edit
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(domain_params)

  
      if @domain.save
  			flash[:success] = "domain created"
  			redirect_to root_url
      else
       render 'new'
      end
    
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to @domain, notice: 'Domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain }
      else
        format.html { render :edit }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain.destroy
    respond_to do |format|
      format.html { redirect_to domains_url, notice: 'Domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
	
	def manage
		@domain = Domain.find(params[:id])
	end
	
	def manage_subset
		@domain = Domain.find(params[:id])
	end
	
	def prepopulatesubset
		@domain = Domain.find(params[:id])
		@subsets = @domain.subsets.map{|set| {:id => set.id,
		:text=>set.name}}
		respond_to do |format|
			format.json{
				render :json => @subsets
			}
		end
	end
	
	def addsubset
		@domain = Domain.find(params[:id])
		@id = params[:subset]
		@subset = Domain.find(@id)
		if(@domain!=@subset&&!@domain.supersets.include?(@subset))
		@domain.subsets << @subset
		@subset.supersets << @domain
		end
		respond_to do |format|
			format.json
			format.html
		end
	end
	
	def removesubset
		@domain= Domain.find(params[:id])
		@subset = Domain.find(params[:subset])
		@domain.subsets.delete(@subset)
		@subset.supersets.delete(@domain)
	end
	
	def manage_superset
		@domain = Domain.find(params[:id])
	end
	
	def prepopulatesuperset
		@domain = Domain.find(params[:id])
		@superset = @domain.supersets.map{|superset| { :id => superset.id, :text => superset.name }}
		respond_to do |format|
			format.json{
				render :json => @superset
			}
		end
	end

	def addsuperset
		@domain = Domain.find(params[:id])
		@id = params[:superset]
		@superset = Domain.find(@id)
		if(!(@domain==@superset)&& !@domain.subsets.include?(@superset))
		@domain.supersets << @superset
		@superset.subsets << @domains
		end
		respond_to do |format|
			format.json
			format.html
		end
	end
	
	def removesuperset
		@domain= Domain.find(params[:id])
		@superset = Domain.find(params[:superset])
		@domain.supersets.delete(@superset)
		@superset.subsets.delete(@domain)
	end
	
	
	def edit_image
		@domain = Domain.find(params[:id])
	end
	
	
	def image
		@domain = Domain.find(params[:id])
		@domain.image = params[:image]
		@domain.save!
		redirect_to edit_image_domain_path(@domain)
	end
	
	
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(:name)
    end
    
    def admin_user
    	redirect_to(root_url) unless current_user.admin?
    end
end

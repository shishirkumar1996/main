class DomainsController < ApplicationController
 before_action :admin_user,only: [:create,:new]

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

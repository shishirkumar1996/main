class AssociatedSetsController < ApplicationController
  before_action :set_associated_set, only: [:show, :edit, :update, :destroy]

  # GET /associated_sets
  # GET /associated_sets.json
  def index
    @associated_sets = AssociatedSet.all
  end

  # GET /associated_sets/1
  # GET /associated_sets/1.json
  def show
  end

  # GET /associated_sets/new
  def new
    @associated_set = AssociatedSet.new
  end

  # GET /associated_sets/1/edit
  def edit
  end

  # POST /associated_sets
  # POST /associated_sets.json
  def create
    @associated_set = AssociatedSet.new(associated_set_params)

    respond_to do |format|
      if @associated_set.save
        format.html { redirect_to @associated_set, notice: 'Associated set was successfully created.' }
        format.json { render :show, status: :created, location: @associated_set }
      else
        format.html { render :new }
        format.json { render json: @associated_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associated_sets/1
  # PATCH/PUT /associated_sets/1.json
  def update
    respond_to do |format|
      if @associated_set.update(associated_set_params)
        format.html { redirect_to @associated_set, notice: 'Associated set was successfully updated.' }
        format.json { render :show, status: :ok, location: @associated_set }
      else
        format.html { render :edit }
        format.json { render json: @associated_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associated_sets/1
  # DELETE /associated_sets/1.json
  def destroy
    @associated_set.destroy
    respond_to do |format|
      format.html { redirect_to associated_sets_url, notice: 'Associated set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associated_set
      @associated_set = AssociatedSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def associated_set_params
      params.fetch(:associated_set, {})
    end
end

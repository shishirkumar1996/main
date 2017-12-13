class VotesController < ApplicationController
  include Finder
  include VoteType
  before_action :logged_in_user

  def create
    @entity = find_by_type params[:entity_id], params[:entity_type]
    redirect_to(root_url) if current_user?(@entity.user)
    @vote_type = find_vote_type params[:vote_type]
    @entity.public_send("#{@vote_type}s").create!(user_id: current_user.id)
    respond_to do |format|
      format.js { render "change" }
    end
  end

end

class VotesController < ApplicationController
  include Finder
  before_action :logged_in_user
  before_action :set_and_check

  def create
    @entity.public_send(@vote_type).create!(user_id: current_user.id)
    @vote_type = @vote_type.to_s.singularize
    respond_to do |format|
      format.js { render "change" }
    end
  end

  private

    def set_and_check
      @entity = find_by_type params[:entity_id], params[:entity_type]
      redirect_to(root_url) if current_user?(@entity.user)
      @vote_type = case params[:vote_type]
      when 'upvote'
        :upvotes
      when 'downvote'
        :downvotes
      end
    end
end

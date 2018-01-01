class RepliesController < ApplicationController
  include Finder
  before_action :logged_in_user

  def create
    @parent = find_by_type params[:parent_id], params[:parent_type]
    @reply = @parent.replies.create! user_id: current_user.id, body: params[:body]
  end
end

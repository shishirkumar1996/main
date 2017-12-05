class BookmarksController < ApplicationController
  include Finder
  before_action :logged_in_user
  before_action :set_entity

  def create
    @entity.bookmarks.create! user_id: current_user.id
    @bookmarked = true
    send_response
  end

  def destroy
    @entity.destroy_bookmark current_user
    @bookmarked = false
    send_response
  end

  private

    def set_entity
      @entity = find_by_type params[:id], params[:type]
    end

    def send_response
      respond_to do |format|
        format.js { render "change" }
      end
    end

end

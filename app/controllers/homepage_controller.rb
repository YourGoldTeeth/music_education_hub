class HomepageController < ApplicationController
  
  def index
  	@resources = Resource.all
  	@notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
  end



end

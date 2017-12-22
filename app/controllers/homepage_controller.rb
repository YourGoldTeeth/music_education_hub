class HomepageController < ApplicationController
  before_action :alert_check

  def index
  	@resources = Resource.all
  	
  	if current_user.role_id == 4
  		@notifications = Homework.all
  		# @alert_check = Homework.last.id
  		@admin = true
  	else	
  		@notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
  		# @alert_check = Assignment.where(user_id: current_user.id).last.id
  		@admin = false
  	end
  end

  def alert_check
    if current_user.role_id == 4
      @alert_check = Homework.last.id
      
    else  
      @alert_check = Assignment.where(user_id: current_user.id).last.id
    end
  end 
end

class HomepageController < ApplicationController
  # before_action :alert_check

  def index
  	@resources = Resource.all
  	
  	if current_user.role_id == 4
  		@notifications = Homework.all.order("created_at DESC")
  		# @alert_check = Homework.last.id
  		@admin = true
  	else	
  		@notifications = Assignment.where(user_id: current_user.id).order("created_at DESC")
  		# @alert_check = Assignment.where(user_id: current_user.id).last.id
  		@admin = false
  	end
  end

  # def alert_check
  #   @clicked = false
  #   if current_user.role_id == 4
  #     @alert_check = Homework.last.id
  #     @notif_id = current_user.notification_id
  #       if @alert_check > @notif_id
  #          @alert = true  
  #           # current_user.update_attribute(:notification_id, @alert_check)
  #       else   
  #          @alert = false
  #       end
  #   else  
  #     # @alert_check = Assignment.where(user_id: current_user.id).last.id
  #     @notif_id = current_user.notification_id
  #       # if @alert_check > @notif_id
  #          @alert = true
  #           current_user.update_attribute(:notification_id, @alert_check)   
  #       else   
  #          @alert = false
  #       end
  #   end
  # end 



end

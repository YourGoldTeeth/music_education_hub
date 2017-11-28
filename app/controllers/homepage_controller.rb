class HomepageController < ApplicationController
  
  def index
  	@resources = Resource.all
  end

end

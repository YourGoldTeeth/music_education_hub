class RegistrationsController < Devise::RegistrationsController
  def new
    
  	@instruments = Instrument.all
  end

  def create
    super
    @instruments = Instrument.all
  end

  def update
    super
  	@instruments = Instrument.all
  end

  def destroy
  end
end

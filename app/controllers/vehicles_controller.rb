class VehiclesController < ActionController::Base

  def index 
    @vehicles = Vehicle.all 
    gon.vehicles = @vehicles
  end

end

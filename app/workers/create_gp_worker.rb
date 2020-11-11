class CreateGpWorker
  include Sidekiq::Worker
  
  def perform(vh, sa, lon, lat)
    @vehicle = Vehicle.where(vehicle_identifier: vh)
    if @vehicle.empty?
      @vehicle = Vehicle.create(vehicle_identifier: vh, sent_at: sa,
        longitude: lon, latitude: lat)
      if !@vehicle.valid?
        return
      else
        @gp = @vehicle.gps.create(sent_at: sa,longitude: lon, latitude: lat)  
      end
      elsif @vehicle[0].sent_at<sa
      @vehicle[0].update(sent_at: sa, longitude: lon, latitude: lat)
      @gp = @vehicle[0].gps.create(sent_at: sa,longitude: lon, latitude: lat)
    else
      @gp = @vehicle[0].gps.create(sent_at: sa,longitude: lon, latitude: lat)
    end
  end
end
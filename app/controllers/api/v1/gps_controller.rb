class Api::V1::GpsController < ApplicationController


  def index
    @gp = Gp.all 
    render json: @gp.as_json(only: [:id, :vehicle_identifier, :sent_at, :longitude ,:latitude]), status: :created
  end 

  def show
    @gp = Gp.find(params[:id])
    render json: @gp.as_json(only: [:id, :vehicle_identifier, :sent_at, :longitude ,:latitude]), status: :created
  end

  def create
    @vehicle = Vehicle.where(vehicle_identifier: params[:vehicle_identifier])
    if @vehicle.empty?
      @vehicle = Vehicle.create(vehicle_identifier: params[:vehicle_identifier], sent_at: params[:sent_at],
        longitude: params[:longitude], latitude: params[:latitude])
      if !@vehicle.valid?
        render :json => { :status => "error", :message => "identifier must be AAAA-00 or AA-0000 format" }
        return
      else
        @gp = @vehicle.gps.create(sent_at: params[:sent_at],longitude: params[:longitude], latitude: params[:latitude])  
      end
      elsif @vehicle[0].sent_at<params[:sent_at]
      @vehicle[0].update(sent_at: params[:sent_at], longitude: params[:longitude], latitude: params[:latitude])
      @gp = @vehicle[0].gps.create(sent_at: params[:sent_at],longitude: params[:longitude], latitude: params[:latitude])
    else
      @gp = @vehicle[0].gps.create(sent_at: params[:sent_at],longitude: params[:longitude], latitude: params[:latitude])
    end
    
    render json: @gp.as_json(only: [:id, :vehicle_identifier, :sent_at, :longitude ,:latitude]), status: :created
  end

end
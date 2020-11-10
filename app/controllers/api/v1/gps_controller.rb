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
      @gp = Gp.create(vehicle_id: @vehicle.id, sent_at: params[:sent_at],longitude: params[:longitude], latitude: params[:latitude])  
    else
      @vehicle.update(sent_at: params[:sent_at], longitude: params[:longitude], latitude: params[:latitude])
      @gp = Gp.create(vehicle_id: @vehicle.ids[0],sent_at: params[:sent_at],longitude: params[:longitude], latitude: params[:latitude])
    end
    render json: @gp.as_json(only: [:id, :vehicle_identifier, :sent_at, :longitude ,:latitude]), status: :created
  end

end
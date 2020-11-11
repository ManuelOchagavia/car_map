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
    CreateGpWorker.perform_async(params[:vehicle_identifier], params[:sent_at], params[:longitude], params[:latitude])
    render :json => { :status => "received", :message => "If the identifier is correct and the sent_at is the closest to present it will render on the map" }
  end

end

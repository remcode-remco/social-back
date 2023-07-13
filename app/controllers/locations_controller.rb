class LocationsController < ApplicationController
  # before_action :set_location, only: [:show, :update, :destroy]

  def search
    if params[:search] && params[:search].length > 0
      @locations = Location.where("name LIKE ?", "%#{params[:search]}%").limit(5)
      render json: @locations, each_serializer: LocationSearchSerializer
    else
      @locations = Location.all.limit(5)
      render json: @locations, each_serializer: LocationSearchSerializer
    end
  end

  def show
    render json: @location
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      render json: @location, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
    head :no_content
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :postcode, :name)
  end
end

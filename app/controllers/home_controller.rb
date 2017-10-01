class HomeController < ApplicationController
  def index
    @location = set_location
  end

  private

  def set_location
    return request.location if request.location.latitude != 0.0

    request.location.data["latitude"] = Constants::DEFAULT_LAT
    request.location.data["longitude"] = Constants::DEFAULT_LONG
    return request.location
  end
end


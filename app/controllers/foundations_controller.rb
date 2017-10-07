class FoundationsController < ApplicationController
  def new
    country = get_user_country
    @user_country_code = country.alpha2
    @user_local_currency = country.currency.iso_code
    @foundation = Foundation.new
  end

  def create
    @foundation = Foundation.new(foundation_params)
    if @foundation.save
      flash[:success] = "Congratulations! Your foundation was deployed to the Ethereum blockchain."
      redirect_to foundation_path(@foundation)
    else
      render :new
    end
  end

  def show
    @foundation = Foundation.find(params[:id])
  end

  private

  def foundation_params
    params.require(:foundation).permit(:country_alpha2, :local_currency, :postal_code, :min_starting_funds, :min_participants, :activation_deadline)
  end

  def get_user_country
    loc = set_location
    user_location = Geocoder.search("#{loc.latitude},#{loc.longitude}").first
    @user_country ||= ISO3166::Country.find_country_by_name(user_location.country)
  end
end

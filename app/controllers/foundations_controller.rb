class FoundationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foundations = Foundation.all
  end

  def new
    country = get_user_country
    @user_country_code = country.alpha2
    @user_local_currency = country.currency.iso_code
    @foundation = Foundation.new
  end

  def create
    @foundation = Foundation.new(foundation_params)
    if @foundation.save
      redirect_to new_pledge_path(@foundation.id)
    else
      render :new
    end
  end

  def show
    @foundation = Foundation.includes(:users).where(id: params[:id]).first
  end

  private

  def foundation_params
    params.require(:foundation).permit(:country_alpha2, :local_currency, :postal_code, :min_starting_funds, :min_participants, :activation_deadline)
  end

  def get_user_country
    location = set_location
    location.data["latitude"] = location.data["loc"].split(',')[0] unless location.data["latitude"].present?
    location.data["longitude"] = location.data["loc"].split(',')[1] unless location.data["longitude"].present?
    user_location = Geocoder.search("#{location.data["latitude"]},#{location.data["longitude"]}").first
    @user_country ||= ISO3166::Country.find_country_by_name(user_location.country)
  end
end

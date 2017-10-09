class PledgesController < ApplicationController
  before_action :authenticate_user!

  def new
    @foundation = Foundation.find(params[:id])
    @decorated_foundation = FoundationDecorator.new(@foundation)
    @pledge = Pledge.new
  end

  def create
    @decorated_foundation = FoundationDecorator.new(Foundation.find(params[:id]))
    @pledge = Pledge.new(
                amount: params[:amount],
                foundation_id: params[:id],
                user_id: current_user.id,
                currency: @decorated_foundation.foundation.local_currency
              )

    if @pledge.save
      if @pledge.foundation.deploy
        flash[:success] = "Congratulations! Your foundation was deployed to the Ethereum blockchain. "
      end

      flash[:success] << "Your pledge has been created."
      redirect_to pledge_path(@pledge)
    end

  end

  def show
    @decorated_pledge = PledgeDecorator.new(Pledge.find(params[:id]))
    @decorated_foundation = FoundationDecorator.new(@decorated_pledge.pledge.foundation)
  end

  def cancel
  end

  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end

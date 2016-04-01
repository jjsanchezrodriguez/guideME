class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @excursions = Excursion.all.map{|excursion| [excursion.name, excursion.id]}
    @user = User.find params[:user_id]
    @offer = Offer.new
  end

  def new_direct
    @excursion = Excursion.find params[:excursion_id]
    @user = current_user
    @offer = Offer.new
    binding.pry
    if @offer.create(offer_params)
        flash[:notice] = "Offer created!"
        redirect_to @user
    else
      @errors = @offer.errors.full_messages
      flash.now[:alert] = "There was a problem creating a Offer"
      render 'new'
    end
    render "new_direct"
  end

  def new_create
     @user = current_user
    if @user.offers.create(offer_params)
        flash[:notice] = "Offer created!"
        redirect_to @user
    else
      @errors = @offer.errors.full_messages
      flash.now[:alert] = "There was a problem creating a Offer"
      render 'new'
    end
  end  

  def create
    @user = User.find params[:user_id]
    if @user.offers.create(offer_params)
      flash[:notice] = "Offer created!"
      redirect_to @user
    else
      @errors = @offer.errors.full_messages
      flash.now[:alert] = "There was a problem creating a Offer"
      render 'new'
    end
  end

  private
  def offer_params
    params.require(:offer).permit(:language, :date, :excursion_id, :user_id)
  end
end

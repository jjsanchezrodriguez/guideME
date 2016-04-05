class OffersController < ApplicationController
  def index
    @offers = Offer.all.page(params[:page]).per(12)
  end

  def new
    @excursion = Excursion.find(params[:excursion_id])
    @user = current_user
    @offer = Offer.new
    @excursions_list = Excursion.all.map{|excursion| [excursion.name, excursion.id]}
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
    @user = current_user
    if @user.offers.create(offer_params)
      flash[:notice] = "Offer created!"
      redirect_to guides_path
    else
      @errors = @offer.errors.full_messages
      flash.now[:alert] = "There was a problem creating a Offer"
      render 'new'
    end
  end

  private
  def offer_params
    params.require(:offer).permit(:language, :date, :excursion_id)
  end
end

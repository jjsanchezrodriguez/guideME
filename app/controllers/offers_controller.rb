class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @excursions = Excursion.all.map{|excursion| [excursion.name, excursion.id]}
    @guide = User.find params[:guide_id]
    @offer = Offer.new
  end

  def create
    @guide = Guide.find params[:guide_id]
    if @guide.offers.create(offer_params)
      flash[:notice] = "Offer created!"
      redirect_to @guide
    else
      @errors = @offer.errors.full_messages
      flash.now[:alert] = "There was a problem creating a Offer"
      render 'new'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:excursion_id, :guide_id, :language, :date, :available)
  end
end

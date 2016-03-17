class ToursController < ApplicationController
  def new
    @all_offers =  Offer.all.map{|offer| [offer.excursion_id, offer.guide_id]}
    @offers_excursions =  Offer.all.map{|offer| [offer.excursion.name, offer.excursion_id]}.uniq
    @offers_guides =  Offer.all.map{|offer| [offer.excursion.name, offer.excursion_id]}.uniq
  
 
    @tourist = Tourist.find params[:tourist_id]
    @tour = Tour.new
  end

  def create
    @tourist = Tourist.find params[:tourist_id]
    if @tourist.tours.create(tour_params)
      flash[:notice] = "Tour created!"
      redirect_to @tourist
    else
      @errors = @tourist.tours.full_messages
      flash.now[:alert] = "There was a problem creating a Tour"
      render 'new'
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:excursion_id, :guide_id, :tourist_id, :guide_point, 
                                :excursion_point, :guide_description, :excursion_description)
  end

end

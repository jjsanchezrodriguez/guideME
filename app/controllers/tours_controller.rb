class ToursController < ApplicationController
  def new
    @tourist = current_user
    @excursion = Excursion.find(params[:excursion_id])
    @offer = Offer.find(params[:offer_id])
    @guide = User.where(id: @offer.user_id)
    @tour = Tour.new
  end

  def create
    binding.pry
    if @tours.create(tour_params)
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
    binding.pry
    params.require(:tour).permit(:excursion_id, :guide_id, :tourist_id, :guide_point, 
                                :excursion_point, :guide_description, :excursion_description)
  end

end

class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end 

  def new
    @offer = Offer.find(params[:offer_id])
    binding.pry
    Tour.create( excursion_id: @offer.excursion_id,
                 guide_id: @offer.user_id,
                 tourist_id: current_user.id )
      redirect_to root_path
  end

  def create
    @tour = Tour.new tour_params
    if @tour.save
      flash[:notice] = "Tour created!"
      redirect_to root_path
    else
      @errors = @tourist.tours.full_messages
      flash.now[:alert] = "There was a problem creating a Tour"
      render 'new'
    end
  end

  private

  def tour_params_create
    params.require(:tour).permit(:excursion_id, :guide_id, :tourist_id)
  end 

  def tour_params
    params.require(:tour).permit(:excursion_id, :guide_id, :tourist_id, :guide_point, 
                                :excursion_point, :guide_description, :excursion_description)
  end

end

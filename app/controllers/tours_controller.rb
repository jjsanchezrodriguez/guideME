class ToursController < ApplicationController
  def new
    @tourist = Tourist.find params[:tourist_id]
    @tour = @tourist.tours.new

    @all_offers =  Offer.all.map{|offer| [offer.excursion_id, offer.guide_id]}
  end

  def create
     @tourist = Tourist.find params[:tourist_id]
    
    # respond_to do |format|
    #   if @tourist.tour.create(tour_params)
    #     format.html { redirect_to @tourist.tour, notice: 'Tour was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @tourist.tour }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end

   
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

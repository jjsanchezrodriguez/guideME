class OffersController < ApplicationController
	def index
		@offers = Offer.all
	end

	def new
		@excursions = Excursion.all
		#binding.pry
		@guide = Guide.find params[:guide_id]
		@offer = Offer.new
		
	end

	def create
		@offer = Offer.new offer_params
		if @offer.save
			flash[:notice] = "Offer created!"
			redirect_to @offer 
		else
			@errors = @offer.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Offer"
			render 'new'
		end
	end

	private
	def offer_params
		
		params.require(:offer).permit(:excursion_id,:guide_id,:language,:date,:available)
		binding.pry
	end
end

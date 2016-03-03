class ExcursionsController < ApplicationController
	def index
		@excursions = Excursion.all
	end

	def show
		@excursion = Excursion.find(params[:id])
		
		@offers = Offer.where ["excursion_id=?", @excursion.id]
		
	end
end

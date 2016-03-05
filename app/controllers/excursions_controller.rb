class ExcursionsController < ApplicationController
	def index
		
		if !params[:init_date]
			@excursions = Excursion.all
		else	
			from = Date.parse(params[:init_date])
			to   = Date.parse(params[:final_date])
			if(from > to)
				flash.now[:alert] = "Date Error"
				#@excursions = Excursion.all
			else	
				@excursions = Excursion.where(start: from..to)
			end	
		end
	end

	def show
		@excursion = Excursion.find(params[:id])
		@offers = Offer.where ["excursion_id=?", @excursion.id]
		#binding.pry
	end
end

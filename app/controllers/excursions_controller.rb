class ExcursionsController < ApplicationController
	def index
		if !params[:init_date]
			@excursions = Excursion.all
		else	
			from = Date.parse(params[:init_date])
			to   = Date.parse(params[:final_date])
			if(from > to)
				#hay que añadirlo al aplication_helper.rb en helpers
				flash.now[:alert] = "Date Error"   
				@excursions = Excursion.all
			else	
				@excursions = Excursion.where(start: from..to)	
			end	
		end
	end

	def show
		@excursion = Excursion.find(params[:id])
		#binding.pry
	end

	def new
		@excursion = Excursion.new
	end

	def create
		@excursion = Excursion.new excursion_params
		if @excursion.save
			flash[:notice] = "Excursion created!"
			redirect_to @excursion #Es igual que redirect_to excursion_path(@project)
		else
			@errors = @excursion.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Excursion"
			render 'new'
		end
	end

	def edit
		@excursion = Excursion.find params[:id]
	end

	def update
		@excursion = Excursion.find params[:id]
		if @excursion.update_attributes excursion_params
			flash.now[:notice] = "Excursion #{@excursion.name} edited!"
			redirect_to excursions_path
		else
			@errors = @excursion.errors.full_messages
			flash.now[:alert] = "There was a problem editing the excursion #{@excursion.name}"
			render 'edit'
		end
	end

	def destroy
		@excursion = Excursion.find params[:id]
		@excursion.destroy

		flash[:notice] = "Excursion #{@excursion.name} destroyed!"
		redirect_to excursions_path
	end

	private
	def excursion_params
		params.require(:excursion).permit(:name,:duration,:price,:start,:description, :monuments)
	end
end

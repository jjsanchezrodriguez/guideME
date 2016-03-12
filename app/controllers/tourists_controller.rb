class TouristsController < ApplicationController
	def index
		@tourists = Tourist.all
		@guides = Guides.all
		@excursions = Excursions.all
	end

	def show
		@tourist  = Tourist.find(params[:id])
	end

	def new
		@tourist = Tourist.new
	end

	def create
		@tourist  = Tourist.new tourist_params
		if @tourist.save
			flash[:notice] = "Tourist created!"
			redirect_to @tourist 
		else
			@errors = @tourist.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Tourist"
			render 'new'
		end
	end

	def edit
		@tourist = Tourist.find params[:id]
	end

	def update
		@tourist =Tourist.find params[:id]
		if @tourist.update_attributes tourist_params
			flash.now[:notice] = "Tourist #{@tourist.name} edited!"
			redirect_to guides_path
		else
			@errors = @tourist.errors.full_messages
			flash.now[:alert] = "There was a problem editing tourist #{@tourist.name}"
			render 'edit'
		end
	end

	def destroy
		@tourist = Tourist.find params[:id]
		@tourist.destroy

		flash[:notice] = "Tourist #{@tourist.name} destroyed!"
		redirect_to tourists_path
	end

	private
	def tourist_params
		params.require(:tourist).permit(:name,:email)
	end
end

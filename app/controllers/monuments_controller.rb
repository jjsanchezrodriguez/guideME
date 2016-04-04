class MonumentsController < ApplicationController
	def index
		@monuments = Monument.all.page(params[:page]).per(12)
	end

	def show
		@monument = Monument.find(params[:id])
	end

	def new
		@monument = Monument.new	
	end

	def create
		@monument = Monument.new monument_params
		if @monument.save
			flash[:notice] = "Monument created!"
			redirect_to @monument 
		else
			@errors = @monument.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Monument"
			render 'new'
		end
	end

	def edit
		@monument = Monument.find params[:id]
	end

	def update
		@monument = Monument.find params[:id]
		if @monument.update_attributes monument_params
			flash.now[:notice] = "Monument #{@monument.name} edited!"
			redirect_to monument_path
		else
			@errors = @monument.errors.full_messages
			flash.now[:alert] = "There was a problem editing monument #{@monument.name}"
			render 'edit'
		end
	end

	def destroy
		@monument = Monument.find params[:id]
		@monument.destroy

		flash[:notice] = "Monument #{@monument.name} destroyed!"
		redirect_to monuments_path
	end

	private
	def monument_params
		params.require(:monument).permit(:name,:description,:image, :long, :lat)
	end

end

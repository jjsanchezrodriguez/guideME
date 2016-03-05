class GuidesController < ApplicationController
	def index
		@guides = Guide.all
	end

	def show
		@guide = Guide.find(params[:id])
	end

	def new
		@guide = Guide.new
	end

	def show
		@guide = Guide.new excursion_params
		if @guide.save
			flash[:notice] = "Guide created!"
			redirect_to @guide #Es igual que redirect_to excursion_path(@project)
		else
			@errors = @guide.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Guide"
			render 'new'
		end
	end

	private
	def guide_params
		params.require(:guide).permit(:name,:duration,:price,:start,:description, :monuments)
	end
end

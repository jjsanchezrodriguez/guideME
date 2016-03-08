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

	def create
		@guide = Guide.new guide_params
		if @guide.save
			flash[:notice] = "Guide created!"
			redirect_to @guide 
		else
			@errors = @guide.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Guide"
			render 'new'
		end
	end

	def edit
		@guide = Guide.find params[:id]
	end

	def update
		@guide = Guide.find params[:id]
		if @guide.update_attributes guide_params
			flash.now[:notice] = "Guide #{@guide.name} edited!"
			redirect_to guides_path
		else
			@errors = @guide.errors.full_messages
			flash.now[:alert] = "There was a problem editing guide #{@guide.name}"
			render 'edit'
		end
	end

	def destroy
		@guide = Guide.find params[:id]
		@guide.destroy

		flash[:notice] = "Guide #{@guide.name} destroyed!"
		redirect_to guides_path
	end

	private
	def guide_params
		params.require(:guide).permit(:name,:phone,:email)
	end
end

class GuidesController < ApplicationController
	def index
		@guides = User.where(role: "guide").page(params[:page]).per(2)
	end

	def index_admin
		@guides = User.where(role: "guide").page(params[:page]).per(5)
	end

	def show
		@guide = User.find(params[:id])
	end

	def new
		@guide = User.new
	end

	def create
		@guide = User.new guide_params
		if @guide.save
			flash[:notice] = "Guide created!"
			redirect_to guides_admin_path 
		else
			@errors = @guide.errors.full_messages
			flash.now[:alert] = "There was a problem creating a Guide"
			render 'new'
		end
	end

	def edit
		@guide = User.find params[:id]
	end

	def update
		@guide = User.find params[:id]
		if @guide.update_attributes guide_params
			flash.now[:notice] = "Guide #{@guide.name} edited!"
			redirect_to guides_admin_path
		else
			@errors = @guide.errors.full_messages
			flash.now[:alert] = "There was a problem editing guide #{@guide.name}"
			render 'edit'
		end
	end

	def destroy
		@guide = User.find params[:id]
		@guide.destroy
		flash[:notice] = "Guide #{@guide.name} destroyed!"
		redirect_to guides_admin_path
	end

	private
	def guide_params
		params.require(:user).permit(:name,:phone,:email,:avatar,:role)
	end
end

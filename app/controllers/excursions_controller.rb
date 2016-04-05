class ExcursionsController < ApplicationController
	def index
		@guides = Guide.all
		@excursions = Excursion.all
	end

	def index_admin
		@excursions = Excursion.all.page(params[:page]).per(12)
	end

	def exc_date
		@excursion = Excursion.find(params[:excursion_id])
	end

	def all
		@excursions = Excursion.page(params[:page]).per(2)
		render "show_query"
	end

	def show_query
		if params[:init_date].blank? || params[:final_date].blank?
			flash.now[:alert] = "Date Error"  
			render 'index'
		else	
			from = Date.parse(params[:init_date])
			to = Date.parse(params[:final_date])
			if(from > to)
				#hay que añadirlo al aplication_helper.rb en helpers
				flash.now[:alert] = "Date Error"   
				@excursions = Excursion.page(params[:page]).per(3)
			else	
				@excursions = Excursion.where(start: from..to).page(params[:page]).per(2)
			end	
		end
	end

	def show
		@excursion = Excursion.find(params[:id])
	end

	def new
		@excursion = Excursion.new
	end

	def create
		@excursion = Excursion.new excursion_params
		if @excursion.save
			flash[:notice] = "Excursion created!"
			@excursions = Excursion.all
			#redirect_to @excursion #Es igual que redirect_to excursion_path(@project)
			redirect_to excursions_admin_path
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
			redirect_to excursions_admin_path
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
		redirect_to excursions_admin_path
	end

	private
	def excursion_params
		params.require(:excursion).permit(:name,:duration,:price,:start,:description, :available, :monuments)
	end
end

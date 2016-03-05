module ApplicationHelper
	def display_flash_message
		if flash[:notice] 
			flash[:notice]
		elsif flash[:alert]
			flash[:alert]
		end 
	end
end

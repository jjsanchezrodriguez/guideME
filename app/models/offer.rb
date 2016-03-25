class Offer < ActiveRecord::Base
	belongs_to :excursion
	# belongs_to :guide
	belongs_to :user
	
end

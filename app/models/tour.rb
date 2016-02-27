class Tour < ActiveRecord::Base
	belongs_to :excursion
	belongs_to :guide
	belongs_to :turist
end

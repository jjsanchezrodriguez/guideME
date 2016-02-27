class Monument < ActiveRecord::Base
	 has_and_belongs_to_many :excursions
end

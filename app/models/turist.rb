class Turist < ActiveRecord::Base
	has_many :tours
	has_many :excursions, through => :tours
	has_many :guide, through => :tours
end

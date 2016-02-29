class Guide < ActiveRecord::Base
	has_many :tours
	has_many :excursions, :through => :tours
	has_many :turists, :through => :tours

	has_many :offers
	has_many :excursions, :through => :offers
end

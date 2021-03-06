class Excursion < ActiveRecord::Base
	has_many :tours
	has_many :guides, :through => :tours
	has_many :tourists, :through => :tours

	# has_many :offers
	# has_many :guides, :through => :offers

	has_many :offers
	has_many :users, :through => :offers

	has_and_belongs_to_many :monuments

	def monuments_limited(number)
		monuments.limit(number)
	end
end

class AddMonExcToMonuments < ActiveRecord::Migration
  def change
  	create_table :excursions_monuments, id: false do |t|
	    t.belongs_to :monument, index: true
	    t.belongs_to :excursion, index: true
  	end
  end
end

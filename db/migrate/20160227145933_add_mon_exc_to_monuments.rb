class AddMonExcToMonuments < ActiveRecord::Migration
  def change
  end

  create_table :monuments_excursions, id: false do |t|
    t.belongs_to :monument, index: true
    t.belongs_to :excursion, index: true
  end

end

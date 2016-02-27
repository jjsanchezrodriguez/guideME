class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    	t.belongs_to :excurion, index: true
    	t.belongs_to :guide, index: true
    	t.string     :language
    	t.date       :date
    	t.integer    :available 
      t.timestamps null: false
    end
  end
end

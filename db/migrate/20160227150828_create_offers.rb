class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    	t.belongs_to :excursion, index: true
    	t.belongs_to :user, index: true
    	t.string     :language
    	t.date       :date
    	t.integer    :available 
      t.timestamps null: false
    end
  end
end

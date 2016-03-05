class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
    	t.string  :name
    	t.string  :duration
    	t.float   :price
    	t.date 	  :start
    	t.text	  :description 
      t.timestamps null: false
    end
  end
end

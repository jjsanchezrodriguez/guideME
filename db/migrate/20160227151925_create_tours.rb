class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
    	t.belongs_to :excursion, index: true
    	t.belongs_to :guide, index: true
    	t.belongs_to :tourist, index: true
    	t.integer :guide_point
    	t.integer :excursion_point
    	t.text    :guide_description
    	t.text    :excursion_description
      t.timestamps null: false
    end
  end
end

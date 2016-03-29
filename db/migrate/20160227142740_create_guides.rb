class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
    	t.string :name, null: false
    	t.string :phone,null: false
    	t.string :email,null: false
	   	t.string :image
      t.timestamps null: false
    end
  end
end

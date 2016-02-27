class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
    	t.string :name
    	t.text   :description
    	t.string :image
    	t.float  :long
    	t.float  :lat
        t.timestamps null: false
    end
    
  end
end

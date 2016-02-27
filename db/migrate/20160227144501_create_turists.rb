class CreateTurists < ActiveRecord::Migration
  def change
    create_table :turists do |t|
    	t.string :name
    	t.string :email

      t.timestamps null: false
    end
  end
end

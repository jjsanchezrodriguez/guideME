class CreateTourists < ActiveRecord::Migration
  def change
    create_table :tourists do |t|
    	t.string :name
    	t.string :email
    	t.string :image
      t.timestamps null: false
    end
  end
end

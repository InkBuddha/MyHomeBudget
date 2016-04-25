class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
    	t.string :name
    	t.decimal :price
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end

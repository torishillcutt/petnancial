class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :cost
      t.date :order_date
      t.date :arrival_date
      t.date :complete_date
      t.string :category
      t.integer :pet_id
      
      t.timestamps null: false
    end
  end
end

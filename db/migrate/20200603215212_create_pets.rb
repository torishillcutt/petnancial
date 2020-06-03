class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :category
      t.string :care_instructions
      t.integer :user_id
      t.timestamps null: false
    end
  end
end

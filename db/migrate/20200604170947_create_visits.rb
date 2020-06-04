class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :pet_id
      t.integer :vet_id
      t.string :vet_location
      t.integer :cost
      t.string :description
    end
  end
end

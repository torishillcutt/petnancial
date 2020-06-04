class CreateVets < ActiveRecord::Migration
  def change
    create_table :vets do |t|
      t.string :name
      t.string :location
      t.string :specialty
    end
  end
end

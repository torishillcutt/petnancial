class AddAverageCostToPets < ActiveRecord::Migration
  def change
    add_column  :pets, :average_cost, :integer
  end
end

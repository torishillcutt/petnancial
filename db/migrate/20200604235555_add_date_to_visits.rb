class AddDateToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :date, :date
  end
end

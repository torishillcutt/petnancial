class Item < ActiveRecord::Base
    belongs_to :pet



    ######CALL BACK MUST ACCOUNT FOR IF THERE IS NO VISITS, OR ONLY ONE VISIT
  after_save do
    pet = Pet.find(self.pet.id)
    if pet.visits.length > 1 && pet.items.length > 1
      first_visit = pet.visits.order(:date).first.date
      last_visit = pet.visits.order(:date).last.date
      visit_time_diff = Time.diff(first_visit, last_visit)
      if visit_time_diff[:month].to_i != 0
        visit_average = pet.visits.sum(:cost) / visit_time_diff[:month].to_i

        first_item = pet.items.order(:order_date).first.order_date
        last_item = pet.items.order(:order_date).last.order_date
        item_time_diff = Time.diff(first_item, last_item)
        if item_time_diff[:month].to_i != 0
          item_average = pet.items.sum(:cost) / item_time_diff[:month].to_i

          pet.average_cost = item_average.to_i + visit_average.to_i
          pet.save
        end
      end
    elsif pet.visits.length == 0
        if pet.items.length > 1
            first_item = pet.items.order(:order_date).first.order_date
            last_item = pet.items.order(:order_date).last.order_date
            item_time_diff = Time.diff(first_item, last_item)
            if item_time_diff[:month].to_i != 0
              pet.average_cost = pet.items.sum(:cost).to_i / item_time_diff[:month].to_i
              pet.save
            end
        elsif pet.items.length == 1
            pet.average_cost = pet.items.first.cost.to_i
            pet.save
        end
    elsif pet.visits.length == 1 
        if pet.items.length == 1
           cost = pet.items.first.cost + pet.visits.first.cost
           time_diff = Time.diff(pet.items.order(:order_date).first.order_date, pet.visits.order(:date).first.date)
           if time_diff[:month].to_i != 0
             pet.average_cost = cost / time_diff[:month].to_i
             pet.save
           end
        else
          first_item = pet.items.order(:order_date).first.order_date
          last_item = pet.items.order(:order_date).last.order_date
          item_time_diff = Time.diff(first_item, last_item)
          if item_time_diff[:month] != 0
            item_average = pet.items.sum(:cost) / item_time_diff[:month].to_i
            cost =  pet.visits.first.cost.to_i + pet.items.sum(:cost).to_i
            pet.average_cost = cost / item_time_diff[:month].to_i
            pet.save
          end
        end
    end
  end
end
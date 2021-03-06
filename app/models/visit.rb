class Visit < ActiveRecord::Base
    belongs_to :pet
    belongs_to :vet
    ######CALL BACK MUST ACCOUNT FOR IF THERE IS NO ITEMSS, OR ONLY ONE ITEM
    #after_create do
        #self.name = login.capitalize if name.blank?
     # end

     # pet.items.order(:order_date).first.order_date
# pet.items.order(:order_date).last.order_date
# time_diff_components = Time.diff(first, last)
# RETURNS => {:year=>0, :month=>6, :week=>2, :day=>5, :hour=>0, :minute=>0, :second=>0, :diff=>"6 months, 2 weeks, 5 days and 00:00:00"}
# time_diff_components[:month] - time owned
# pet.items.sum(:cost) - total cost
# avg cost = total cost - time owned

#pet.visits.order(:date).first.date
#pet.visits.order(:date).last.date
#pet.visit.sum.cost


#=> #<Pet id: 30, name: "Harry Beard", age: 4, category: "hyena", care_instructions: "Eius occaecati qui nam.", user_id: 90, created_at: "2020-06-05 00:04:04", updated_at: "2020-06-05 00:04:04", average_cost: nil>
#>> pet.visits.order(:date).first.date
#D, [2020-06-04T20:25:34.421866 #7895] DEBUG -- :   Visit Load (0.4ms)  SELECT  "visits".* FROM "visits" WHERE "visits"."pet_id" = ?  ORDER BY "visits"."date" ASC LIMIT 1  [["pet_id", 30]]
#=> Sun, 16 Jun 2019
#>> visit1 = _
#=> Sun, 16 Jun 2019
#>> pet.visits.order(:date).last.date
#D, [2020-06-04T20:26:20.417105 #7895] DEBUG -- :   Visit Load (0.5ms)  SELECT  "visits".* FROM "visits" WHERE "visits"."pet_id" = ?  ORDER BY "visits"."date" DESC LIMIT 1  [["pet_id", 30]]
#=> Wed, 04 Mar 2020
#>> visit2 = _
#=> Wed, 04 Mar 2020
#>> pet.visits.sum(:cost)
#D, [2020-06-04T20:28:11.973644 #7895] DEBUG -- :    (0.7ms)  SELECT SUM("visits"."cost") FROM "visits" WHERE "visits"."pet_id" = ?  [["pet_id", 30]]
#=> 7536
#>> Time.diff(visit2, visit1)
#=> {:year=>0, :month=>8, :week=>3, :day=>1, :hour=>1, :minute=>0, :second=>0, :diff=>"8 months, 3 weeks, 1 day and 01:00:00"}
#>> time_diff = _
#=> {:year=>0, :month=>8, :week=>3, :day=>1, :hour=>1, :minute=>0, :second=>0, :diff=>"8 months, 3 weeks, 1 day and 01:00:00"}
#>> time_diff[:month]
#=> 8
#>> time_owned = _
#=> 8
#>> visit_cost = pet.visits.sum(:cost)
#D, [2020-06-04T20:30:56.386915 #7895] DEBUG -- :    (0.3ms)  SELECT SUM("visits"."cost") FROM "visits" WHERE "visits"."pet_id" = ?  [["pet_id", 30]]
#=> 7536
#>> visit_cost / time_owned
#=> 942
#>> avg_vet_cost = _
#=> 942
#>> item_cost = pet.items.sum(:cost)
#D, [2020-06-04T20:32:30.820030 #7895] DEBUG -- :    (0.5ms)  SELECT SUM("items"."cost") FROM "items" WHERE "items"."pet_id" = ?  [["pet_id", 30]]
#=> 122
#>> item_cost / time_owned
#=> 15
#>> average_item_cost = _
#=> 15
#>> avg_vet_cost + average_item_cost
#=> 957
#>> average_cost = _
#=> 957
#>> pet.average_cost = average_cost
#=> 957
end
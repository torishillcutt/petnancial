class Item < ActiveRecord::Base
    belongs_to :pet

 # after_create do
  #  self.name = login.capitalize if name.blank?
  #end
end

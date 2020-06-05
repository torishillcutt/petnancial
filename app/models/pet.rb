class Pet < ActiveRecord::Base
    belongs_to :user
    has_many :items
    has_many :visits
    has_many :vets, through: :visits

    
end

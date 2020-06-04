class Vet < ActiveRecord::Base
    has_many :visits
    has_many :pets, through: :visits
end
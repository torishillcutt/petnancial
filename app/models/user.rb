class User < ActiveRecord::Base
    has_many :pets
    has_many :items, through: :pets
    has_secure_password
    validates :email, uniqueness: true
end

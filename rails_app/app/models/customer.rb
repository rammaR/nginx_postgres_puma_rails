class Customer < ApplicationRecord
    
    has_many :orders
    validates :address, presence: true
    validates :name, presence: true
    validates :email, presence: true

end

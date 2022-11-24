class Product < ApplicationRecord
  belongs_to :category

  validates :description, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :category, presence: true
  validates_associated :category

  def full_description
    "#{self.description} by #{self.price}"
  end

end

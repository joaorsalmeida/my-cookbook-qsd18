class Cuisine < ApplicationRecord
  has_many :recipes

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
end

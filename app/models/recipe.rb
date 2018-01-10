class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :title, presence: true
end

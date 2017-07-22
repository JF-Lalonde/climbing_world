class Quality < ApplicationRecord
  has_many :routesqualities
  has_many :routes, through: :routesqualities
  validates :star_value, presence: true
end

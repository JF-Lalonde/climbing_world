class Quality < ApplicationRecord
  has_many :routesqualities
  has_many :routes, through: :routesqualities
end

class Route < ApplicationRecord
  validates :route_name, :description, presence: true
  belongs_to :rating
  belongs_to :pitch
  belongs_to :location
  has_many :comments
  has_many :routesqualities
  has_many :qualities, through: :routesqualities
  has_many :users_routes
  has_many :users, through: :users_routes
end

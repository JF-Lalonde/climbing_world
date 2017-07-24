class Route < ApplicationRecord
  validates :route_name, :description, presence: true
  belongs_to :rating
  belongs_to :pitch
  belongs_to :location
  has_many :comments, dependent: :destroy
  has_many :routesqualities, dependent: :destroy
  has_many :qualities, through: :routesqualities
  has_many :users_routes, dependent: :destroy
  has_many :users, through: :users_routes

  def unique_locations
    Location.pluck(:region).uniq
  end
end

class Route < ApplicationRecord
  validates :route_name, :description, presence: true
  belongs_to :rating
  belongs_to :pitch
  belongs_to :location
end

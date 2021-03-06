class Location < ApplicationRecord
  validates :region, :city, :state, presence: true
  has_many :routes, dependent: :destroy
end

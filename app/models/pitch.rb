class Pitch < ApplicationRecord
  # validates :number, presence: true
  has_many :routes
end
